struct Rec {
    a: Int;
    b: Bool;
}

struct NestedStruct {
    foo: String;
    rec: Rec?;
}

contract ContractWithOptionalNestedStruct {
    nested: NestedStruct?;

    init() {
        self.nested = null;
    }
}
