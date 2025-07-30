struct SerializeOptions {
    smallInt: Int as int8;
    bigInt: Int as int257;
    str: String;
    optStr: String?;
}

contract TestContract {
    data: SerializeOptions;

    init() {
        self.data = SerializeOptions{
            smallInt: -128,
            bigInt: 12345678901234567890,
            str: "hello",
            optStr: null
        };
    }
}