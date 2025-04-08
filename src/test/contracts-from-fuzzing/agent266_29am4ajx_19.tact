struct NestedFlat {
    val: Int;
}

contract DualNested {
    a: NestedFlat;
    b: NestedFlat;

    init() {
        self.a = NestedFlat{ val: 10 };
        self.b = NestedFlat{ val: 20 };
    }
}