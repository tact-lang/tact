struct InnerMost {
    a: Int;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

struct Outer {
    z: Inner;
    w: Int;
}

contract DeepNestedTest {
    val: Outer;
    
    init() {
        self.val = Outer{
            z: Inner{
                x: 1,
                y: InnerMost{
                    a: 2
                }
            },
            w: 3
        };
    }
}
