struct NestedSerial {
    a: Int as uint8;
    b: Sub;
}

struct Sub {
    c: Int as int64;
    d: String?;
}

contract StorageTest {
    s: NestedSerial;

    init() {
        self.s = NestedSerial{
            a: 200,
            b: Sub{
                c: -54321,
                d: "stringly"
            }
        };
    }
}