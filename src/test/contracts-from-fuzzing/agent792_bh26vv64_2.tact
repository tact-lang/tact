struct Inner {
    x: Int;
}

struct Outer {
    opt: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ opt: Inner{x: 42} };
    }
}