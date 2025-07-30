struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract ContractWithStructOption {
    field: OptionalStruct?;

    init() {
        self.field = OptionalStruct{ foo: 5, bar: true };
    }
}