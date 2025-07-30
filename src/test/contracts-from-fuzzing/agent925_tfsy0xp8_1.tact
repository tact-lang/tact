struct InnerMost {
    z: Bool;
}

struct Inner {
    m: Int?;
    n: InnerMost;
}

struct Outer {
    a: Int;
    b: Bool?;
    c: Inner;
}

contract DeepNestedExample {
    data: Outer;
    
    init() {
        self.data = Outer{
            a: 1,
            b: true,
            c: Inner{
                m: null,
                n: InnerMost{
                    z: false,
                },
            },
        };
    }
}