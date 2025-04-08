struct OptionalStruct {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
}

contract OptionalStructStorage {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            optionalInt: null,
            optionalBool: true,
            optionalAddress: null
        };
    }
}
