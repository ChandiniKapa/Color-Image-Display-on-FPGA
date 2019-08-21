%read the image
%I = imread('leena.jpg');	
%imshow(I);
img = imread('GS.jpg');
% Image Transpose
%img2 = rgb2gray(img);
imm = imresize(img,[512 512]);
s = size(imm)
%A = [transpose(imm(:,:,1));transpose(imm(:,:,2));transpose(imm(:,:,3))];
%imgTrans = transpose(imm);

%imgTrans=permute(img,[2 1])
% iD conversion%
%A = imgTrans(:);

		
%Extract RED, GREEN and BLUE components from the image
R = transpose(imm(:,:,1));			
G = transpose(imm(:,:,2));
B = transpose(imm(:,:,3));

%make the numbers to be of double format for 
RB = double(R);
GB = double(G);
BB = double(B);

%Raise each member of the component by appropriate value. 
R1 = RB.^(4/8); % 8 bits -> 3 bits
G1 = GB.^(4/8); % 8 bits -> 3 bits
B1 = BB.^(4/8); % 8 bits -> 2 bits

%tranlate to integer
R2 = uint8(R1); % float -> uint8
G2 = uint8(G1);
B2 = uint8(B1);

%minus one cause sometimes conversion to integers rounds up the numbers wrongly
R3 = R2-1; % 3 bits -> max value is 111 (bin) -> 7 (dec)(hex)
G3 = G2-1;
B3 = B2-1; % 11 (bin) -> 3 (dec)(hex)

%G4 = bitshift(G3, 4); % 3 << G (shift by 3 bits)
%B4 = bitshift(B3, 8); % 6 << B (shift by 6 bits)
R4 = double(R3);
G4 = double(G3);
B4 = double(B3);
%R3=double(R3);
G4 = bitshift(G4, 4); % 3 << G (shift by 3 bits)
B4 = bitshift(B4, 8); % 6 << B (shift by 6 bits)
COLOR = R4+G4+B4;      % R + 3 << G + 6 << B



%translate to hex to see how many lines
%COLOR_HEX = dec2hex(COLOR);

imgHex = dec2hex(COLOR);
% New txt file creation
fid = fopen('GS.coe', 'wt');
% Hex value write to the txt file
fprintf(fid,'memory_initialization_radix=16;\n');
fprintf(fid,'memory_initialization_vector=\n');
fprintf(fid, '%x\n',COLOR);
% Close the txt file
fclose(fid)