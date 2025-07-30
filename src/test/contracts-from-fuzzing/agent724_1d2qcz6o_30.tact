struct Inner {
    x: Int = 7;
    y: Int = 8;
}

struct Outer {
    inr: Inner;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{ inr: Inner{} };
    }
}