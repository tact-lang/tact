// Test for contract without defaults but init() setting fields
contract TestContract {
    counter: Int;

    init() {
        self.counter = 99;
    }
}