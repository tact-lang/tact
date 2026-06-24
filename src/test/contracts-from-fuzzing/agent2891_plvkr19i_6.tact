struct Inner {
    p: Int;
}

struct Outer {
    ref1: Inner;
    ref2: Inner;
    ref3: Inner;
}

contract MultiStructRefs {
    data: Outer;

    init() {
        self.data = Outer{
            ref1: Inner{p:1},
            ref2: Inner{p:2},
            ref3: Inner{p:3}
        };
    }
}