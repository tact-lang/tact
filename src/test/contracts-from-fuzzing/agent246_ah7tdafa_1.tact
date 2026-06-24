struct DeepNested {
    inner: InnerLayer;
}

struct InnerLayer {
    level: Int;
    nested: InnerMost?;
}

struct InnerMost {
    flag: Bool;
    text: String;
}

contract NestedTest {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            inner: InnerLayer{
                level: 1,
                nested: InnerMost{
                    flag: true,
                    text: "hi"
                }
            }
        };
    }
}