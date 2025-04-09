struct Pair { first: Int; second: Int }

asm(-> 1 0) fun swapInts(a: Int, b: Int): Pair { 
    a PUSHINT
    b PUSHINT
}