struct OptionalStruct {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optionalInt: 1,
            optionalBool: true,
            optionalString: "test",
        };
    }
}