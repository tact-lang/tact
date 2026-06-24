struct DeeplyNested {
    level1: Int;
    level2: InnerStruct;
}

struct InnerStruct {
    inside: Bool;
    message: String;
}

contract DeepNestTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            level1: 42,
            level2: InnerStruct{
                inside: true,
                message: "ok"
            }
        };
    }
}
