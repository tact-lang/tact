struct Inner {
    x: Int;
    y: Bool;
    z: String?;
}

contract NestedFields {
    s: Inner;

    init() {
        self.s = Inner{ x: 5, y: false, z: null };
    }
}
