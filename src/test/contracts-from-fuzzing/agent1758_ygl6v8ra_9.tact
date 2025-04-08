struct Inner {
    a: Int;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    middle1: Middle;
    middle2: Middle;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer {
            middle1: Middle { inner1: Inner{a:1}, inner2: Inner{a:2}},
            middle2: Middle { inner1: Inner{a:3}, inner2: Inner{a:4}}
        };
    }
}