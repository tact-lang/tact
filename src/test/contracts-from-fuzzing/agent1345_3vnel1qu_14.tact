// struct with mixed serialization annotations
struct MixedSerial {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Bool;
    e: String;
}

contract Test {
    val: MixedSerial;

    init() {
        self.val = MixedSerial{
            a: 10,
            b: -123,
            c: 7,
            d: false,
            e: "zzz"
        };
    }
}