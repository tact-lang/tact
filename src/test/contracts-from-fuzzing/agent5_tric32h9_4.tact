struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract PartialInitOptionalStruct {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: 42,
            c: "hello",
        };
    }
}