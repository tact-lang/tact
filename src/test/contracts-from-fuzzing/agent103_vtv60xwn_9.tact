struct Inner {
    a: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner;
    in4: Inner;
    in5: Inner;
    in6: Inner;
}

contract ManyNestRefs {
    data: Outer;

    init() {
        self.data = Outer{
            in1: Inner{a:1},
            in2: Inner{a:2},
            in3: Inner{a:3},
            in4: Inner{a:4},
            in5: Inner{a:5},
            in6: Inner{a:6},
        };
    }
}