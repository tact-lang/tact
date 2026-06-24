struct DeepOptionalStruct {
    nested: NestedOptional?;
}

struct NestedOptional {
    inside: InsideOptional?;
}

struct InsideOptional {
    value: Int;
}

contract TestContract {
    s: DeepOptionalStruct;
    
    init() {
        self.s = DeepOptionalStruct {
            nested: NestedOptional {
                inside: null
            }
        };
    }
}