// Contract with persistent storage of struct with optional nested struct
struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner?;
}

contract OptEmptyInit {
    store: Outer;

    init() {
        self.store = Outer{ bar: null };
    }
}