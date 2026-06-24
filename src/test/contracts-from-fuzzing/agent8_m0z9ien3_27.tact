asm fun doubleInc(x: Int): Int { INC INC }

contract TestDoubleInc {
    fun test(x: Int): Int {
         return doubleInc(x);
    }
}
