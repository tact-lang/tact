struct DoubleSerialize {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
}

contract SerializeTypes {
    val: DoubleSerialize;
    init() {
        self.val = DoubleSerialize{a:255, b:-500, c:ton("1")};
    }
}
