struct SerTest {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Int as uint8;
}

contract SerializationFormatsTest {
    s: SerTest;

    init() {
        self.s = SerTest{ a: 42, b: 10, c: true, d: "hi", e: 7 };
    }
}