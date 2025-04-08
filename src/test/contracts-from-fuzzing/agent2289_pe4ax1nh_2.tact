struct Inner {
    x: Int;
    y: Bool;
    z: String?;
}

contract NestedContract {
    val: Int;
    nested: Inner;

    init() {
        self.val = 5;
        self.nested = Inner{ x: 10, y: true, z: null };
    }
}