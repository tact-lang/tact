struct Inner {
    value: Int;
    text: String;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract DeepMultiNest {
    data: Top;

    init() {
        self.data = Top{
            m1: Middle{ in1: Inner{ value:1, text:"a" }, in2: Inner{ value:2, text:"b" } },
            m2: Middle{ in1: Inner{ value:3, text:"c" }, in2: Inner{ value:4, text:"d" } }
        };
    }
}