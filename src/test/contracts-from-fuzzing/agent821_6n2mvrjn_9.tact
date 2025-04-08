struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    inner1: InnerMost;
    inner2: InnerMost?;
}

struct Outer {
    middle: Middle;
    optMiddle: Middle?;
}

contract TestMultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner1: InnerMost{a:1,b:true,c:"x"},
                inner2: null,
            },
            optMiddle: null,
        };
    }
}