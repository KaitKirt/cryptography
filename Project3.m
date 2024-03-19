%Kaitlyn Kirt, CMOR220, Spring 2024, Cryptography project
%Project3.m
%This script is a project on decoding a text 
%Last modified: February 12, 2024

%driver
function Project3
%upload file
disp('Original Text:')
text=fileread('encodedtext.txt');
text=strip(text);
disp(text)

%decodes original text
disp('Message:')
[message]=decoder(text,10.^5)
end

function [num]=downlow(text)
%inputs: text
%outputs: num
%description: this function swaps each character in the text with a number
num=double(text)-95; %switches from text to ASCII values then subtracts that value by 95
end 

function [text]=downlowinv(num)
%inputs: num
%outputs: text
%description: this function swaps each numerical value with a character
text=char(num+95); %adds 95 to the ASCII value then switches from values to text
end

function [message]=decoder(text,maxiter)
%inputs: text,maxiter
%outputs: message
%description: this function tests loglike sums to find a decoding key
global letterprob
load('letterprob.mat')
M=letterprob;
y = randperm(27); %creates a random array of 27 numbers
    for i=1:maxiter %runs code 100,000 times
        ymaybe = y; %assigns random y as ymaybe
        loc=randperm(27,2); %takes to random numbers from permutation
        ymaybe(loc(2))=y(loc(1)); %swaps the value of loc(2) with loc(1) 
        ymaybe(loc(1)) = y(loc(2)); %swaps the value of loc(1) with loc(2)
        if loglike(text,ymaybe,M)>loglike(text,y,M)
            y = ymaybe;
        end
    end
    message = downlowinv(y(downlow(text))); %decodes the text with best key
    message = strrep(message,'`',' '); %changes apostrophes with spaces
end

function [value]=loglike(text,y,M)
%inputs: text,y,M
%outputs: value 
%description: this function computes the value of the loglike function
value=0;
t = downlow(text); %changes text to values
   for k=1:length(text)-1 %runs code for length(text)-1 times 
       value=value+log(M(y(t(k)),y(t(k+1)))); %computes value of summation
   end
end 


