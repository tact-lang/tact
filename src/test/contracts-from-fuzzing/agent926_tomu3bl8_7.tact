struct Inner {
    x: Int;
}

struct Middle {
    inner1: Inner?;
    inner2: Inner?;
}

struct Outer {
    middle1: Middle?;
    middle2: Middle?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            middle1: null,
            middle2: null
        };
    }
}