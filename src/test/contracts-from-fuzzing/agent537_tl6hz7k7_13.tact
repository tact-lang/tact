struct OptionalNested {
    sub: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{ sub: null };
    }

    receive() {
        self.s = OptionalNested{ sub: Inner{ val: 5 } };
    }
}
