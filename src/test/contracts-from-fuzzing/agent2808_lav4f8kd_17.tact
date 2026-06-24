struct Unusual {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int5;
    d: Int as uint3;
}

contract Test {
    val: Unusual;
    init() {
        self.val = Unusual{ a:12, b:34, c:3, d:7 };
    }
}