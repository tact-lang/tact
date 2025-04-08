struct MinimalNested {
    in1: Int;
    in2: Bool;
}

contract ContractWithNestedField {
    nested: MinimalNested;

    init() {
        self.nested = MinimalNested{
            in1: 5,
            in2: true
        };
    }
}