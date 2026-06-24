// Test mixed constant and variable persistent fields
contract ConstAndVars {
    const CONST_A: Int = 7;
    const CONST_B: String = "hi";

    x: Int;
    y: Bool;

    init() {
        self.x = 42;
        self.y = true;
    }
}
