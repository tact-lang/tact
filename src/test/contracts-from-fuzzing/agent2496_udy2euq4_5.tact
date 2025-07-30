struct OptionalStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalsInPersistent {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            s: "hello",
            b: null,
            i: 42,
        };
    }
}
