struct InnerMost {
    x: Int;
    y: Bool?;
}

struct Middle {
    im: InnerMost;
    s: String;
}

struct Outer {
    m: Middle;
    b: Bool;
}

contract DeepNestedStruct {
    content: Outer;
    
    init() {
        self.content = Outer{
            m: Middle{
                im: InnerMost{
                    x: 5,
                    y: null
                },
                s: "hi"
            },
            b: true
        };
    }
}