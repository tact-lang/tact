struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{ inner: Inner{ x: 10, y: false }, flag: true };
    }
}