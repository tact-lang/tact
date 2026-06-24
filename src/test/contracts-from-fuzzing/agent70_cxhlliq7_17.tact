struct Pair { a: Int; b: Int }

asm(y x -> 1 0) fun asmPair(x: Int, y: Int): Pair { NOP }

contract TestAsmMultiReturn {
    fun testPair(x: Int, y: Int): Pair {
         return asmPair(x, y);
    }

    fun testPair2(x: Int, y: Int): Pair {
         let p: Pair = asmPair(x, y);
         return p;
    }
}
