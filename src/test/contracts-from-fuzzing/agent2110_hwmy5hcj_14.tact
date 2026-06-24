// Optional contract storage field with struct with default value fields
struct DefVals {
    a: Int = 1;
    b: Bool = true;
}

contract DefaultOption {
    test: DefVals?;
    init() {
        self.test = null;
    }
}