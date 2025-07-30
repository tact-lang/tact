// Edge case: serializations with very small int sizes and optionals
struct TinyFields {
    a: Int as int1;
    b: Int as uint1;
    c: Int?;
}

contract TinySerialization {
    storage: TinyFields = TinyFields{
        a: 0,
        b: 1,
        c: null,
    };

    init() {
        self.storage = TinyFields{
            a: -1,
            b: 1,
            c: 5,
        };
    }

    receive() {
        self.storage = self.storage;
    }
}