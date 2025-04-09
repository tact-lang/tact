struct DeepOptionalNested {
    optNested: NestedOpt?;
}

struct NestedOpt {
    intVal: Int;
    boolFlag: Bool?;
    sliceField: Slice?;
}

contract Test {
    storage: DeepOptionalNested;

    init() {
        self.storage = DeepOptionalNested{
            optNested: null
        };
    }
}
