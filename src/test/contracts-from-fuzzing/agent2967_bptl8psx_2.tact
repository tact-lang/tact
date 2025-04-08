struct DeepNested {
    level1: Int;
    level2: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract DeepStructTest {
    info: DeepNested;

    init() {
        self.info = DeepNested {
            level1: 5,
            level2: InnerStruct { x: 10, y: false },
        };
    }
}