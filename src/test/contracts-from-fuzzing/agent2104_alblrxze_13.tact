struct Serialization {
    a: Int as int8;
    b: Int as uint64;
    c: Int as coins;
}

contract StructSerialization {
    s: Serialization;

    init() {
        self.s = Serialization{
            a: -4,
            b: 123456789,
            c: ton("0.5")
        };
    }
}