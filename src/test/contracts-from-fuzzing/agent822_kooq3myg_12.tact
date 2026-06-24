// test optional nested struct with optional inner field
struct Inner {
    x: Int?;
}

struct Wrapper {
    inner: Inner?;
}

contract TestContract {
    state: Wrapper;
    init() {
        self.state = Wrapper{
            inner: null,
        };
    }
}
