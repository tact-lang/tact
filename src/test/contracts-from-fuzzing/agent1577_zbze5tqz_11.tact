struct Inner {
    foo: Int? = null;
    bar: Bool = true;
}

struct Outer {
    x: Int = 5;
    y: String? = null;
    z: Inner? = null;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{}; // all defaults and null optionals used
    }
}