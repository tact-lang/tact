struct DeepNested {
    x: Int;
    inner: InnerMost;
}

struct InnerMost {
    y: Int;
    z: Bool;
    s: SubInner;
}

struct SubInner {
    val: String;
    opt: Bool?;
}

contract DeepNestTest {
    testField: DeepNested;
    init() {
        self.testField = DeepNested{
            x:123,
            inner: InnerMost{
                y:456,
                z:true,
                s: SubInner{ val:"hi", opt:null }
            }
        };
    }
}
