struct SmallBits {
    a: Int as uint3;
    b: Int as int5;
}

contract TinySerialized {
    val: SmallBits;
    init() {
        self.val = SmallBits{ a: 3, b: -5 };
    }
}