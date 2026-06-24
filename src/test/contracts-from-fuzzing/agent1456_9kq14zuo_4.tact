struct Inner {
    x: Int;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract NestedStructs {
    data: Outer;
    
    init() {
        self.data = Outer{
            mid1: Middle{ in1: Inner{ x: 1 }, in2: Inner{ x: 2 } },
            mid2: Middle{ in1: Inner{ x: 3 }, in2: Inner{ x: 4 } }
        };
    }
}
