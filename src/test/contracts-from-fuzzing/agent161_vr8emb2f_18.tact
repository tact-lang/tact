struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner?;
    str: String;
}

contract WideNested {
    field: Outer;

    init() {
        self.field = Outer{
            in1: Inner{ x:1, y:2 },
            in2: null,
            str: "s",
        };
    }
}
