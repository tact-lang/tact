// Focus on complex persistence across serialization formats
struct MixSerialization {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Bool;
    e: Bool;
    f: String;
    g: Slice;
    h: Address;
}

contract TestContract {
    data: MixSerialization;

    init() {
        self.data = MixSerialization{
            a: 123456789012345,
            b: 255,
            c: -123456789,
            d: true,
            e: false,
            f: "text",
            g: emptyCell().asSlice(),
            h: myAddress()
        };
    }
}
