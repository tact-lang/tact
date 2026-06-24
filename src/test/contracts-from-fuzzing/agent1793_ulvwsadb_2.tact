struct OptionalDeeper {
    value: InnerStruct?;
}

struct InnerStruct {
    num: Int;
}

contract Test {
    optNested: OptionalDeeper;

    init() {
        self.optNested = OptionalDeeper{ value: InnerStruct{ num: 2 } };
    }
}