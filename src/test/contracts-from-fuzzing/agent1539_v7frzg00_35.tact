struct OptionalIntStruct {
    a: Int?;
}

contract ContractOptionalIntStruct {
    foo: OptionalIntStruct?;
    init() {
        self.foo = null;
    }
}