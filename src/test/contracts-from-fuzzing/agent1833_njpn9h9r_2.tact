struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner?;
}

contract StructOptFieldTest {
    s: Outer;
    init() {
        self.s = Outer{ inner: null };
    }
}
