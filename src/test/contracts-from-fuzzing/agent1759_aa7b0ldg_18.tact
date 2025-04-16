// optional struct field with optional inner struct field
struct Inner {
    foo: Int?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }

    receive() {}
}