struct OuterMost {
    a: Int;
    inner: InnerMost;
}

struct InnerMost {
    b: Int;
}

contract OrderTest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            a: 1,
            inner: InnerMost{ b: 2 }
        };
    }
}