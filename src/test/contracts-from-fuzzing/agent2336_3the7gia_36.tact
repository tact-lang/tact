struct IntBool {
    a: Int;
    b: Bool;
}

contract NestedField {
    inField: IntBool;

    init() {
        self.inField = IntBool{ a: 3, b: true };
    }
}