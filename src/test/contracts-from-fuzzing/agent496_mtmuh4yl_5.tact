struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract DeepNestedStruct {
    data: Outer;
    init() {
        self.data = Outer{
            x: Inner{
                y: InnerMost{
                    z: 123
                }
            }
        };
    }
}