struct Inner {
    val: Int;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
    nested4: Inner;
    nested5: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{val:1},
            nested2: Inner{val:2},
            nested3: Inner{val:3},
            nested4: Inner{val:4},
            nested5: Inner{val:5}
        };
    }
}