struct DeepNested {
    val1: Int;
    val2: Inner;
}

struct Inner {
    a: Int;
    b: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Int?;
}

contract TestContract {
    nested: DeepNested;
    
    init() {
        self.nested = DeepNested{
            val1: 1,
            val2: Inner{
                a: 2,
                b: InnerMost{
                    x: 3,
                    y: null,
                },
            },
        };
    }
}