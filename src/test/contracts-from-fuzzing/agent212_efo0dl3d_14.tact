struct Inner {
    val: Int = 123;
}

struct Outer {
    nested: Inner = Inner{};
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{ val: 456 } };
    }
}