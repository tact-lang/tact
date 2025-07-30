struct Inner {
    one: Int;
    two: Bool?;
    three: String;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract NestingWide {
    value: Outer;

    init() {
        self.value = Outer{
            in1: Inner{one: 1, two: null, three: "a"},
            in2: Inner{one: 2, two: true, three: "b"},
            in3: Inner{one: 3, two: false, three: "c"}
        };
    }
}
