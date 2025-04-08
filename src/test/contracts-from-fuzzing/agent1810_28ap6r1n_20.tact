struct SOptional {
    x: Int;
}

contract ContractWithOptionalStruct {
    maybe: SOptional?;

    init() {
        self.maybe = SOptional{x: 5};
    }
}