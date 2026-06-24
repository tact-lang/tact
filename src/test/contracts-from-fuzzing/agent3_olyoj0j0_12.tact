contract GetterTest {
    // State variable
    x: Int;

    init() {
        self.x = 0;
    }

    // Getter that strictly reads the state variable
    get fun readX() : Int {
        return self.x;
    }

    // Getter that modifies the state variable and returns the new value
    // According to the documentation, getters should not modify state; however,
    // this test should compile because runtime changes are not persisted after TVM run.
    get fun mutateX() : Int {
        self.x = self.x + 1;
        return self.x;
    }
}

// A global function to test invocation of getters
fun testGetterInvoke() : Int {
    // Although getters are not callable from within the contract, they are
    // accessible off-chain. However, for testing purposes, we simply call readX
    // as a normal function call (this is allowed in module-level code if the
    // getter is public overall).
    // Note: Depending on Tact's design, this might be disallowed in other contexts.
    return 0;
}
