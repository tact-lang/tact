struct Inner {
    val: Int;
}

struct Outer {
    maybeInner: Inner?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{maybeInner: null};
    }
}