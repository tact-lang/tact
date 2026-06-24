struct OneField {
    a: Int;
}

struct ContainsOpt {
    nested: OneField?;
}

contract OptionalNestedStruct {
    f: ContainsOpt;

    init() {
        self.f = ContainsOpt{
            nested: OneField { a: 111 },
        };
    }
}