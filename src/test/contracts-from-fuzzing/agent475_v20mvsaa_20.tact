struct DeepInner {
    value: Int;
}

struct Wrapper {
    inner: DeepInner;
}

struct Outer {
    wrap: Wrapper;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            wrap: Wrapper{
                inner: DeepInner{ value: 99 }
            }
        };
    }

    receive() {}
}