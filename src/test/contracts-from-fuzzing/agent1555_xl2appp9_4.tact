struct Inner {
    a: Int;
}

struct Outer {
    first: Inner;
    second: Int;
}

contract OrderingTest {
    stored: Outer;

    init() {
        self.stored = Outer{
            first: Inner{a:1},
            second: 2
        };
    }
}
