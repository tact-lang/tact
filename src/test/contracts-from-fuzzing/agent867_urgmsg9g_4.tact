struct OptionalNest {
    inner: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionStorage {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{
            inner: 5,
            flag: null,
            text: "test"
        };
    }
}