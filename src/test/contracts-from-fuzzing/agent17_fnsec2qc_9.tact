asm fun testDepth(): Int { DEPTH }

contract AssemblyTest {
    init() { }
    
    get fun getDepth(): Int {
        return testDepth();
    }
}
