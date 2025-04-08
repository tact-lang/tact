struct Magic {
    a: Int as uint8;
    b: Int as int32;
    c: Int?;
    d: String;
    e: Bool?;
}

contract SerializeNested {
    data: Magic;

    init() {
        self.data = Magic{
            a: 255,
            b: -12345,
            c: 42,
            d: "serialize",
            e: false,
        };
    }

    receive() {}
}