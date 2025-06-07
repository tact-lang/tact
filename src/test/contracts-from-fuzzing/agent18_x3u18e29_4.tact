/// Test snippet for a simple function using let declarations
fun testLet(): Int {
    let a = 10;
    let b: Int = 20;
    return a + b;
}

/// Test snippet for a contract with getter function
contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 100;
    }

    // Getter: returns the stored value, guaranteed not to mutate it
    get fun getFoo(): Int {
        return self.foo;
    }
}

/// Test snippet for a contract with contract parameters (valid usage)
contract ContractWithParams(val: Int) {
    // Simple receiver action
    receive() { cashback(sender()) }
}
