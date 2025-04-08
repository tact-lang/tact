struct DeeplyNested {
    s: InnerStruct;
}

struct InnerStruct {
    i: Int;
    nested: InnerMostStruct;
}

struct InnerMostStruct {
    flag: Bool;
    message: String;
}

contract DeepNestStorage {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            s: InnerStruct{
                i: 5,
                nested: InnerMostStruct{
                    flag: true,
                    message: "deep",
                },
            },
        };
    }
}