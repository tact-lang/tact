struct Inner {
    a: Int = 42;
    b: Bool = true;
}

struct Outer {
    inner: Inner? = Inner{}; // optional, initialized to Inner instance
}

contract NestedDefaultOpt {
    val: Outer;

    init() {
        self.val = Outer{}; // implicit use of Outer default
    }
}
