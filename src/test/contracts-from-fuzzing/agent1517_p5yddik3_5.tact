struct Inner {
    n: Int;
}

struct Outer {
    innerOpt: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer { innerOpt: null };
    }

    receive() {}
}