struct Inner {
    f1: Int;
    f2: String;
}

struct Outer {
    s1: Inner;
    s2: Inner;
    optInner: Inner?;
    flag: Bool;
}

contract NestedStructs {
    store: Outer;

    init() {
        self.store = Outer{
            s1: Inner{f1:1, f2:"a"},
            s2: Inner{f1:2, f2:"b"},
            optInner: null,
            flag: false
        };
    }
}