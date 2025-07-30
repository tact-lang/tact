struct Inner {
    value: Int?;
}

struct Outer {
    field: Inner?;
    num: Int;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{ field: Inner{ value: 42 }, num: 50 };
    }
}