/// Test E: ASM function that uses SWAP without having two elements on the stack.
// This may compile fine (as the error, if any, would be at runtime due to stack underflow).
asm fun swapEmpty(): Int { SWAP }