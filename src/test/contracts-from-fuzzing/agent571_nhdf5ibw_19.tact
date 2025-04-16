struct Inner {
    x: Int = 42;
    y: Bool = true;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{nested: null};
    }
}