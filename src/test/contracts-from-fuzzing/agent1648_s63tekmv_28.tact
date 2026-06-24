// test fields with mix of serialization and optional

struct SerializeAndOpt {
    a: Int as uint8;
    b: Int?;
    c: Int as int16;
    d: Int?;
}

contract TestContract {
    val: SerializeAndOpt;

    init() {
        self.val = SerializeAndOpt {
            a: 42,
            b: null,
            c: 32000,
            d: 123
        };
    }
}