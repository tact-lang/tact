struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract NestedOptionals {
    persistent: Outer;

    init() {
        self.persistent = Outer{inner: null, flag: false};
    }
}