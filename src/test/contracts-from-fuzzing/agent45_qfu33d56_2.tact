struct ManyOptions {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionFieldsTest {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            optInt: 42,
            optBool: null,
            optStr: "hello"
        };
    }
}