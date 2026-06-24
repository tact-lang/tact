struct SerialStruct {
    i: Int as int64;
    u: Int as uint64;
    b: Bool;
    s: String;
}

contract SerialStructTest {
    s: SerialStruct;

    init() {
        self.s = SerialStruct{
            i: 123,
            u: 456,
            b: true,
            s: "string"
        };
    }
}