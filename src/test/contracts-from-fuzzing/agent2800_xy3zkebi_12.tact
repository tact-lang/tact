struct InnerMost {
    v1: Int; 
    v2: String?;
}

struct Inner {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    left: Inner;
    right: Inner?;
}

contract Test {
    big: Outer;

    init() {
        self.big = Outer{
            left: Inner{
                a: InnerMost{v1:1,v2:null},
                b: InnerMost{v1:2,v2:"foo"}
            },
            right: null
        };
    }
}