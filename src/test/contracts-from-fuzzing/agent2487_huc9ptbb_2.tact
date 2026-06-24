struct DeeplyNested {
    level1: Int;
    level2: OptionalStruct?;
}

struct OptionalStruct {
    value: Bool;
    str: String?;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level1: 100,
            level2: OptionalStruct{ value: true, str: null }
        };
    }
}