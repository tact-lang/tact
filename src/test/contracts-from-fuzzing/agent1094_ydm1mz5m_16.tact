struct Inner {
    a: Int;
}

struct Outer {
    b: Inner?;
}

contract ChainOpt {
    data: Outer?;
    init() {
        self.data = null;
    }
}