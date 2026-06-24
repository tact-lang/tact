struct NestedInner {
    deepInt: Int;
    deepBool: Bool;
    deepStr: String;
}

struct OuterContainer {
    outerInt: Int;
    outerStr: String;
    inner: NestedInner;
}

contract DeepNestedTest {
    storage: OuterContainer;
    
    init() {
        self.storage = OuterContainer{
            outerInt: 1,
            outerStr: "test",
            inner: NestedInner{
                deepInt: 42,
                deepBool: true,
                deepStr: "deep"
            }
        };
    }
}