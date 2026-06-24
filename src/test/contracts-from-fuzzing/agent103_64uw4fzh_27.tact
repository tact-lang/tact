struct Inner {
    a: Int;
}

struct Middle {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            in1: Inner{a:1},
            in2: Inner{a:2},
            in3: Inner{a:3}
        };
    }
}
