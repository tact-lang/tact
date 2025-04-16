struct SerializeVariants {
    sInt: Int as int64;
    uInt: Int as uint32;
    coin: Int as coins;
    b: Bool;
    s: String;
}

contract SerializeVariantsTest {
    storage: SerializeVariants;

    init() {
        self.storage = SerializeVariants{
            sInt: -42,
            uInt: 42,
            coin: ton("0.1"),
            b: true,
            s: "hello"
        };
    }
}