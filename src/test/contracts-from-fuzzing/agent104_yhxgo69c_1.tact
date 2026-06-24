struct Inner {
    n: Int;
}

struct Outer {
    field: Inner?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ field: null };
    }
}