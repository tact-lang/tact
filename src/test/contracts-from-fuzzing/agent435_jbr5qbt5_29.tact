// Struct where some fields have explicit serialization format
struct Serialized {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
}

contract TestContract {
    s: Serialized;
    init() {
        self.s = Serialized{
            a: -1000,
            b: 250,
            c: 123456789,
        };
    }
}
