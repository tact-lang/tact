struct Inner {
    x: Int;
}

struct Wrapper {
    in1: Inner;
    in2: Inner;
}

contract WrapContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            in1: Inner{x: 5},
            in2: Inner{x: 10},
        };
    }
}