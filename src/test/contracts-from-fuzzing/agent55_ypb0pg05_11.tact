// Test 1: Basic getter returning an Int (state variable initialized)
contract TestIntGetter {
    x: Int = 42;

    // Unused getter: it is compiled and available off-chain even if never used internally
    get fun getX(): Int {
        return self.x;
    }

    // receive function to ensure the contract is fully compiled
    receive() {}
}
