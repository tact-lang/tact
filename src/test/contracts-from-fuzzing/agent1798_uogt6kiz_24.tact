struct NestedSerialization {
    a: Int as uint16;
    b: Int as int128;
    c: Int as uint1;
}

contract InnerSerialization {
    val: NestedSerialization;
    init() {
        self.val = NestedSerialization{ a: 1, b: -5, c: 0 };
    }
}