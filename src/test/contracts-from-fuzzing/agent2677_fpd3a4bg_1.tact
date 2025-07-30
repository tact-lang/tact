contract TestContract {
    // Test a single primitive persistent state variable
    foo: Int;
    
    init() {
        self.foo = 42;
    }
}