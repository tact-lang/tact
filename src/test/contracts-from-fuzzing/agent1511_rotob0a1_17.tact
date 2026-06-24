struct SerialOptions {
    a: Int as int8;
    b: Int as uint64;
    c: Int as coins;
}

contract SerializedFields {
    s: SerialOptions;

    init() {
        self.s = SerialOptions{
            a: 7,
            b: 123456789,
            c: ton("1")
        };
    }
}
