// test struct with all scalar types with explicit serialization (different bit widths), then persist it
struct SerializedFields {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int257;
    f: Int as uint256;
}

contract SerialContract {
    data: SerializedFields;

    init() {
        self.data = SerializedFields{
            a: -5,
            b: 5,
            c: -1234,
            d: 5678,
            e: -10000000,
            f: 10000000,
        };
    }
}
