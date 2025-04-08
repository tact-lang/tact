struct Composite {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
}

contract CompositeFields {
    composite: Composite;
    init() {
        self.composite = Composite{
            intField: 1,
            boolField: true,
            stringField: "s",
            optionalInt: null,
            optionalBool: false,
            optionalString: null
        };
    }
}