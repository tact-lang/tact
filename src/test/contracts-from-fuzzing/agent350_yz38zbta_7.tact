struct S1 {
    a: Int as int64;
    b: Int as uint8;
    c: Bool;
}

contract SerializeFormats {
    s: S1;

    init() {
        self.s = S1{ a: -123456, b: 255, c: true };
    }
}
