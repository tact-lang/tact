struct InnerMost {
    value: Int?;
}

struct Middle {
    a: Int;
    inner: InnerMost;
    b: Int?;
}

struct Outer {
    first: Middle;
    second: Middle;
}

contract Deep {
    data: Outer;

    init() {
        self.data = Outer{
            first: Middle{a:1, inner:InnerMost{value:null}, b:2},
            second: Middle{a:3, inner:InnerMost{value:4}, b:null}
        };
    }
}