struct Wrapped {
    a: Int;
    b: Bool;
}

contract Test {
    field: Wrapped?;

    init() {
        self.field = null;
    }
}