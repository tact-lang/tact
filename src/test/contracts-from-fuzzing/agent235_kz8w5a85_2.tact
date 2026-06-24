struct DeeplyNested {
    x: Int;
    y: Bool;
    z: InnerMost;
}

struct InnerMost {
    foo: Int;
    opt: Bool?;
}

contract DeepTest {
    deepField: DeeplyNested;
    
    init() {
        self.deepField = DeeplyNested{
            x: 5,
            y: false,
            z: InnerMost{
                foo: 99,
                opt: null
            }
        };
    }
}