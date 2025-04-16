struct NestedOpt {
    a: Int;
    b: Bool;
}

struct ParentOpt {
    x: Int;
    nested: NestedOpt?;
}

contract NullableNestedStruct {
    state: ParentOpt?;
    
    init() {
        self.state = null;
    }
}