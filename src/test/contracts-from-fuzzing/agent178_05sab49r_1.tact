struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructContract {
    data: Outer = Outer{ nested: Inner{ val: 5 }, flag: true };

    init() {
        self.data = Outer{ nested: Inner{ val: 6 }, flag: false };
    }
}
