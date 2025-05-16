struct Inner {
    f: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
    nested4: Inner;
    nested5: Inner;
}

contract ManyNestedSame {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{f:1},
            nested2: Inner{f:2},
            nested3: Inner{f:3},
            nested4: Inner{f:4},
            nested5: Inner{f:5}
        };
    }
}
