asm fun getDepth(): Int { DEPTH }

contract TestAsm {
    receive() {}

    fun testDepth(): Int {
        return getDepth();
    }
}
