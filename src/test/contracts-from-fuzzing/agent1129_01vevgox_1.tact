struct DeepNested {
    f1: Int;
    f2: OptionalDeeper;
}

struct OptionalDeeper {
    ofield: NestedLevel;
}

struct NestedLevel {
    nfield: Int?;
}

contract Test1 {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            f1: 1,
            f2: OptionalDeeper{
                ofield: NestedLevel{
                    nfield: null,
                },
            },
        };
    }
}
