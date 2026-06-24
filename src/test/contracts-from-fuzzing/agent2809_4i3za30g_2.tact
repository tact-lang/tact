struct Inner {
    x: Int = 1;
    y: Bool = false;
    z: String = "text";
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner1: Inner{},
            inner2: Inner{}
        };
    }
}