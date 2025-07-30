struct DeepNested {
    level1: String;
    level2: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    z: InnerMost;
}

struct InnerMost {
    flag: Bool;
    note: String;
}

contract TestDeep {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: "test",
            level2: InnerStruct{
                x: 1,
                y: true,
                z: InnerMost{
                    flag: false,
                    note: "end"
                }
            }
        };
    }
}