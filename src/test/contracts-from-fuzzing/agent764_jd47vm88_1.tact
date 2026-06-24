struct Inner {
    a: Int;
    b: Bool;
}

contract NestedSimple {
    val: Inner;

    init() {
        self.val = Inner{ a: 1, b: true };
    }
}