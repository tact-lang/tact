struct Inner {
    flag: Bool;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    middle1: Middle;
    middle2: Middle;
}

contract DeeplyNestedContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            middle1: Middle{
                inner1: Inner{flag: true},
                inner2: Inner{flag: false},
            },
            middle2: Middle{
                inner1: Inner{flag: true},
                inner2: Inner{flag: true},
            },
        };
    }
}