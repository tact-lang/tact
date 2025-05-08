struct Serializations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Int as int257;
}

contract SerializationContract {
    s: Serializations;

    init() {
        self.s = Serializations{ a: 1, b: -10, c: ton("1"), d: 123456789 };
    }
}