struct Inner {
    a: Int;
    b: Int;
    c: Int;
}

struct Outer {
    f1: Inner;
    f2: Inner;
    f3: Inner;
    f4: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            f1: Inner{a:1, b:2, c:3},
            f2: Inner{a:4, b:5, c:6},
            f3: Inner{a:7, b:8, c:9},
            f4: Inner{a:10, b:11, c:12},
        };
    }
}