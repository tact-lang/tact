struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    im: InnerMost;
    flag: Bool;
}

struct Outer {
    one: Middle;
    two: Middle;
}

contract MultiStructChain {
    content: Outer;
    
    init() {
        self.content = Outer{
            one: Middle{
                im: InnerMost{a: 1, b: "x"},
                flag: true
            },
            two: Middle{
                im: InnerMost{a: 2, b: "y"},
                flag: false
            }
        };
    }
}