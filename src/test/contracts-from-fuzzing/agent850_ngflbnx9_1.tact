struct InnerMost {
    value: Int;
}

struct Inner {
    nested: InnerMost;
    opt: Bool?;
}

struct Middle {
    nested: Inner;
    str: String;
}

contract DeepNestTest {
    data: Middle;
    
    init() {
        self.data = Middle{
            nested: Inner{
                nested: InnerMost{
                    value: 1
                },
                opt: true
            },
            str: "test"
        };
    }
}
