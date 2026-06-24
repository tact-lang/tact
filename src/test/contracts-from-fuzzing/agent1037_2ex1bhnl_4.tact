struct Inner {
    val1: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
    nested4: Inner;
    nested5: Inner;
    nested6: Inner;
    nested7: Inner;
    nested8: Inner;
    nested9: Inner;
    nested10: Inner;
}

contract TestContract {
    bigNested: Outer;

    init() {
        self.bigNested = Outer{
            nested1: Inner{val1: 1},
            nested2: Inner{val1: 2},
            nested3: Inner{val1: 3},
            nested4: Inner{val1: 4},
            nested5: Inner{val1: 5},
            nested6: Inner{val1: 6},
            nested7: Inner{val1: 7},
            nested8: Inner{val1: 8},
            nested9: Inner{val1: 9},
            nested10: Inner{val1: 10}
        };
    }
}