struct MixedLong {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int as uint8;
    f: Int as int16;
    g: Bool?;
    h: String?;
    i: Int?;
    j: Int as uint64;
}

contract LongMixedStruct {
    data: MixedLong;

    init() {
        self.data = MixedLong{
            a: 1,
            b: false,
            c: "abc",
            d: myAddress(),
            e: 255,
            f: -32768,
            g: null,
            h: null,
            i: null,
            j: 987654321,
        };
    }
}