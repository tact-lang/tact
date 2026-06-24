struct Result { r1: Int; r2: Int }

asm(-> 1 0) fun swapTest(): Result {
    10 PUSHINT
    20 PUSHINT
    SWAP
}