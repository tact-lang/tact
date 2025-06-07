// Test extreme trailing brace clusters alone without newlines, may confuse parser
contract TestContract {
    data: Int;

    init() {
        self.data = (((((((((42)))))))));
    }
}