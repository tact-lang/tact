struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Wrapper {
    i1: Inner1?;
    i2: Inner2?;
}

contract NestedOptionalsTest {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            i1: Inner1{ x: 11 },
            i2: Inner2{ y: 22 }
        };
    }
}