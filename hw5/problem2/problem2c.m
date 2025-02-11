format long
N = 65536;
SIN_TABLE = zeros(1, N, 'single');
for i=1:1:N
    sin_value = sin((i-1) * (2*pi) / N);
    SIN_TABLE(i) = single(sin_value); 
end

yaw = single(166.0)
const1 = single(0.017453292)
const2 = single(10430.378)
value = yaw * const1
% note: rem is remainder, int64 converts to integer
% the exact placement of brackets here matters
sindex = rem(int64(value * const2), N) + 1
cindex = rem(int64(value * const2 + 16384), N) + 1
s = SIN_TABLE(sindex)
c = SIN_TABLE(cindex)