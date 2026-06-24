// optional struct nested in struct, with optional primitive inside that
struct Inner {
    val: Int?;
}

struct Middle {
    inner: Inner?;
}

contract TestContract {
    foo: Middle;
    init() {
        self.foo = Middle{ inner: null };
    }
}