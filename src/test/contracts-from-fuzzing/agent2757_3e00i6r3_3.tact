struct Optionals {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    optionalString: String?;
}

contract OptionalFields {
    data: Optionals;

    init() {
        self.data = Optionals{
            optionalInt: null,
            optionalBool: null,
            optionalAddress: null,
            optionalString: null,
        };
    }
}