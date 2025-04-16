struct DeeplyNested {
    level1: Int;
    level2: InnerStruct;
}

struct InnerStruct {
    sub1: Bool;
    sub2: String;
    sub3: LeafStruct;
}

struct LeafStruct {
    leaf1: Int;
    leaf2: Bool;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level1: 10,
            level2: InnerStruct{
                sub1: true,
                sub2: "hi",
                sub3: LeafStruct{leaf1: 1, leaf2: false}
            }
        };
    }
}