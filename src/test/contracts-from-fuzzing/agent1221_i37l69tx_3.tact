struct Inner {
    a: Int?;
    b: String?;
}

struct Mid {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    m1: Mid;
    m2: Mid;
}

contract DeepOptional {
    val: Outer;

    init() {
        self.val = Outer{
            m1: Mid{
                in1: Inner{ a: null, b: null },
                in2: Inner{ a: null, b: null }
            },
            m2: Mid{
                in1: Inner{ a: null, b: null },
                in2: Inner{ a: null, b: null }
            }
        };
    }
}