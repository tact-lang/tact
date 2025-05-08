asm fun depth(): Int { DEPTH }

contract Test {
    receive() {}
    
    fun callDepth(): Int {
        return depth();
    }
}
