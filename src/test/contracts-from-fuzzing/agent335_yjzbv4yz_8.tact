struct B {
    v: Int;
}

struct A {
    nested: B;
}

struct Outer {
    inner: A;
    extra: Bool;
}

contract OrderingTest {
    s: Outer;

    init() {
        self.s = Outer{
            inner: A{ nested: B{ v: 1 } },
            extra: true,
        };
    }
}
