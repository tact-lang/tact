// Struct with nested optional struct default value
struct Inner {
    v: Int = 1;
}

struct Wrapper {
    inner: Inner? = null;
}

contract TestContract {
    f: Wrapper;

    init() {
        self.f = Wrapper{};
    }
}