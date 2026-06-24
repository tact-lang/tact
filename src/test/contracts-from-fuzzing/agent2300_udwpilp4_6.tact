struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    parameter: Outer;

    init() {
        self.parameter = Outer{
            inner: Inner{ val: null }
        };
    }
}