struct InnerMost {
    x: Int;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    a: Middle;
    b: Middle;
    c: Middle;
    d: Middle;
    e: Middle;
}

contract ManyNestedRefs {
    val: Outer;

    init() {
        self.val = Outer{
            a: Middle{ im: InnerMost{x: 1} },
            b: Middle{ im: InnerMost{x: 2} },
            c: Middle{ im: InnerMost{x: 3} },
            d: Middle{ im: InnerMost{x: 4} },
            e: Middle{ im: InnerMost{x: 5} }
        };
    }
}