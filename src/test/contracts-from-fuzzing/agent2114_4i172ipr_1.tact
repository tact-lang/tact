struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    x: Int?;
    y: InnerMost;
}

struct Outer {
    foo: Inner?;
    bar: Int;
}

contract DeepNestedOptional {
    data: Outer;
    
    init() {
        self.data = Outer{
            foo: Inner{
                x: 10,
                y: InnerMost{
                    a: 5,
                    b: true,
                }
            },
            bar: 42,
        };
    }
}
