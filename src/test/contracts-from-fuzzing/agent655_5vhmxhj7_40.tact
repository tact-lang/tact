// test struct with many different serialization forms
struct SerialForms {
    a: Int as uint1;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as uint256;
}

contract SerialFormsTest {
    s: SerialForms;
    init() {
        self.s = SerialForms{
            a: 1,
            b: -10,
            c: 123,
            d: -45678,
            e: 123456789,
            f: -123456789123456789,
            g: 123456789123456789123456789,
        };
    }
}
