struct NestedMany {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

struct Inner {
    v: Int;
}

contract NestedManyTest {
    store: NestedMany;

    init() {
        self.store = NestedMany{
            inner1: Inner{v:1},
            inner2: Inner{v:2},
            inner3: Inner{v:3}
        };
    }
}
