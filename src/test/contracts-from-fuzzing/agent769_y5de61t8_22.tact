struct Base {
    x: Int;
}

contract NullableBase {
    test: Base?;
    init() {
        self.test = null;
    }
}