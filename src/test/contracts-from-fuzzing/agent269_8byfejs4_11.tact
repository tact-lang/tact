struct S {
    a: Int;
    b: Int as uint8;
    c: Int as int4;
    d: Int as uint32;
    e: Int;
}

contract SerializedFields {
    data: S;

    init() {
        self.data = S{ a:1, b:2, c:3, d:4, e:5 };
    }
}