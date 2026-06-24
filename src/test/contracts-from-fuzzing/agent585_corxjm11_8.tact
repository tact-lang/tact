struct SerializedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializedFields {
    s: SerializedInts;

    init() {
        self.s = SerializedInts{ a:1, b:2, c:3 };
    }
}