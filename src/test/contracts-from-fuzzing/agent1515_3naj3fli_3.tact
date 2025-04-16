struct DeeplyNested {
    innerVal: Int;
    innerStr: String;
}

struct MiddleLayer {
    deep: DeeplyNested;
    flag: Bool;
}

contract DeepNestedStruct {
    mid: MiddleLayer;

    init() {
        self.mid = MiddleLayer{
            deep: DeeplyNested{
               innerVal: 0,
               innerStr: "x",
            },
            flag: true,
        };
    }
}