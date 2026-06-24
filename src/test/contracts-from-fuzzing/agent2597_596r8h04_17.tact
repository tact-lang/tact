struct S {
    a: Int as uint64;
    b: Int as int32;
    c: String;
    d: Bool;
    e: Int;
}

contract SerialTest {
    rec: S;

    init() {
        self.rec = S{
            a: 123,
            b: -12,
            c: "hi",
            d: true,
            e: 77,
        };
    }
}