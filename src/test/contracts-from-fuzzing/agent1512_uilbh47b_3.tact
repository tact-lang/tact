struct Inner {
    a: Int;
}

struct Outer {
    innerOpt: Inner?;
    b: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: null,
            b: 42
        };
    }
}