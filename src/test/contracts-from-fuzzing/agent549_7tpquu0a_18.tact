struct Inner {
    a: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract SameStructTwice {
    data: Outer;
    init() {
        self.data = Outer{
            inner1: Inner{a: 1},
            inner2: Inner{a: 2},
        };
    }
}