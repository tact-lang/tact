struct Inner {
    foo: Int? = null;
}

struct Outer {
    bar: Inner? = null;
}

contract TestContract {
    x: Outer;

    init() {
        self.x = Outer{
            bar: null
        };
    }
}
