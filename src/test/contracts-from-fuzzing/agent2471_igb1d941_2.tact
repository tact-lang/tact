struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    innerOpt: Int?;
}

contract ContractWithNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            innerInt: 1,
            innerBool: true,
            innerOpt: null,
        };
    }
}