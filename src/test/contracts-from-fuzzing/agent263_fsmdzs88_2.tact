struct NestedOne {
    a: Int;
    b: Bool;
}

contract StructField {
    s: NestedOne;

    init() {
        self.s = NestedOne{a: 2, b: true};
    }
}