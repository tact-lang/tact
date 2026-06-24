struct SerializationSizes {
    smallInt: Int as uint8;
    medInt: Int as int32;
    bigInt: Int as int257;
    flag: Bool;
    txt: String;
}

contract SizesContract {
    sizes: SerializationSizes;

    init() {
        self.sizes = SerializationSizes{
            smallInt: 1,
            medInt: 12345,
            bigInt: 123456789,
            flag: true,
            txt: "hi",
        };
    }
}