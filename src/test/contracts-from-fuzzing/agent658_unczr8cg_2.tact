struct DeepNest {
    level1: Int;
    level2: Bool;
    level3: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract MultiLevel {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            level1: 1,
            level2: true,
            level3: InnerStruct {
                foo: 42,
                bar: false
            }
        };
    }
}