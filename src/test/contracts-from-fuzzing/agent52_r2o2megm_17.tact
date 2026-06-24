// Scenario L: Declaring a local variable with wildcard name and not accessing it

contract Test {
    receive() {
        let _ : Int = 42;
        // Do nothing with _, as it's meant to be discarded
    }
}
