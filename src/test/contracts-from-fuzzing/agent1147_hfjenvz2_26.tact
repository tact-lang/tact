// nested optional struct
struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ inner: null };
    }
}