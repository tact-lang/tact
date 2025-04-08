struct Inner {
    val: Int?;
}

struct Outer {
    in1: Inner?;
    in2: Inner?;
}

contract OptionalNested {
    s: Outer;

    init() {
        self.s = Outer{
            in1: null,
            in2: Inner{val: 42}
        };
    }
}
