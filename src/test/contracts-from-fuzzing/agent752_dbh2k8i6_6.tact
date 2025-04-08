struct Padding {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
    e: Int as uint4;
    f: Int as uint4;
}

contract PackedSmall {
    data: Padding;
    init() {
        self.data = Padding{ a:1, b:2, c:3, d:4, e:5, f:6 };
    }
}