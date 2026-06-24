struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    c: Int;
    d: InnerMost;
}

struct Outer {
    e: Int?;
    f: Inner;
}

contract DeepNestedStructTest {
    s: Outer;
    
    init() {
        self.s = Outer{
            e: null,
            f: Inner{
                c: 1,
                d: InnerMost{
                    a: 2,
                    b: true
                }
            }
        };
    }
}
