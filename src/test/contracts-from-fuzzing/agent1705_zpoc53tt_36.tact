message Empty1 {}
message Empty2 {}

struct Inner {
    e1: Empty1?;
    e2: Empty2?;
}

contract OptEmptyMsgTest {
    s: Inner;

    init() {
        self.s = Inner{
            e1: null,
            e2: null,
        };
    }
}