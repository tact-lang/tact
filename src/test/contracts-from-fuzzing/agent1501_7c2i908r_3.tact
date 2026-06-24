struct DeepNested {
    level2: NestedOpt;
    finalVal: Int;
}

struct NestedOpt {
    level1: PosOpt;
    other: Int;
}

struct PosOpt {
    x: Int?;
    y: Int?;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level2: NestedOpt{
                level1: PosOpt{ x: null, y: 8 },
                other: 10,
            },
            finalVal: 20,
        };
    }
}