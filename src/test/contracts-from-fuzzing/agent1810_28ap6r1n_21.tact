struct SOptional {
    x: Int;
}

contract ContractOptNull {
    maybe: SOptional?;

    init() {
        self.maybe = null;
    }
}