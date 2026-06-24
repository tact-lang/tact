asm fun identity(x: Int): Int { x }

contract TestIdentity {
    receive() {}
    
    fun id(): Int {
        return identity(42);
    }
}
