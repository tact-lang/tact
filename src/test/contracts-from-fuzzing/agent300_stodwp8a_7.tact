struct Deeper {
    value: Int;
}

struct Inner {
    deeperOpt: Deeper?;
}

struct Outer {
    innerOpt: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: null,
        };
    }
}