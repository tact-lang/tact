struct Inner {
    f1: Int;
    f2: Int?;
}

struct Outer {
    s1: Inner;
    s2: Inner?;
}

contract NestedStructsCompose {
    f: Outer;

    init() {
        self.f = Outer{
            s1: Inner{f1:1,f2:2},
            s2: null,
        };
    }
}