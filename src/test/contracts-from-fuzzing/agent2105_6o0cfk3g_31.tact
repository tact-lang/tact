struct OptStruct {
    x: Int?;
}

struct Outer {
    inner: OptStruct;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            inner: OptStruct{ x: null }
        };
    }
}