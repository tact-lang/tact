struct InnerMost {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct Middle {
    m1: Int;
    m2: Bool;
    inner: InnerMost;
}

struct Outer {
    o1: Int;
    middle: Middle;
}

contract DeepTree {
    state: Outer;
    init() {
        self.state = Outer{
            o1: 5,
            middle: Middle{
                m1: 6,
                m2: true,
                inner: InnerMost{ f1:7, f2:false, f3:"hi" }
            }
        };
    }
}
