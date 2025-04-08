// Test contract with a single simple Int storage variable
contract SimpleIntVar {
    count: Int;

    init() {
        self.count = 123;
    }
}