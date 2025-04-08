struct Inner {
    z: Int?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{ nested: Inner{ z: null } };
    }
}