struct NestedOptSerialize {
    a: Int?;
    b: Bool;
}

contract OptionalAssign {
    val: NestedOptSerialize;

    init() {
        self.val = NestedOptSerialize{ a: null, b: false };
    }
}