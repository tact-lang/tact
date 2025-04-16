struct S {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as coins;
    e: Int;
}

contract SerializedFields {
    val: S;

    init() {
        self.val = S{
            a: 255, b: -123, c: 9, d: 1000000, e: -42
        };
    }
}