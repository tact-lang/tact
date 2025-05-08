asm fun swapReturn(a: Int, b: Int): Int { SWAP DROP }

contract TestAsm {
    fun testSwap(): Int {
        // swapReturn should return the second argument (10) when given (5, 10)
        return swapReturn(5, 10);
    }
}
