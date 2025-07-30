struct StructWithOptional {
    foo: Int;
    bar: Bool?;
}

contract ContractOptionalBool {
    myField: StructWithOptional;

    init() {
        self.myField = StructWithOptional{ foo: 42, bar: null };
    }
}
