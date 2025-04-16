// Scenario 4: Using '_' as a variable name in a let binding (should be rejected)
contract Test {
    fun test() : Int {
        let _ = 123;
        return 123;
    }
    receive() { self.test(); }
}
