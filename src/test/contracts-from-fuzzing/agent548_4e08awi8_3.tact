struct InnerMost {
    x: Int;
    y: Bool;
}

struct Mid {
    in1: InnerMost;
    in2: InnerMost;
}

struct Outer {
    m1: Mid;
    m2: Mid;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Mid{ in1: InnerMost{ x:1, y:true }, in2: InnerMost{ x:2, y:false } },
            m2: Mid{ in1: InnerMost{ x:3, y:true }, in2: InnerMost{ x:4, y:false } }
        };
    }
}
