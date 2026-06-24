struct IntFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract ChainInt {
    ints: IntFields;
    init() {
        self.ints = IntFields{ a:1, b:2, c:3, d:4, e:5 };
    }
}