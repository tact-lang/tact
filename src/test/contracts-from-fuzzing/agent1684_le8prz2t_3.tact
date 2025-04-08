struct InnerStruct {
    optionalInt: Int?;
    optionalBool: Bool?;
}

contract OptionalStructContract {
    nestedOptionals: InnerStruct = InnerStruct{optionalInt: null, optionalBool: true};

    init() {
        self.nestedOptionals = InnerStruct{optionalInt: 42, optionalBool: null};
    }
}