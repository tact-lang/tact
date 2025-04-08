struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrapper {
    inner: Inner?;
    extra: Int?;
}

contract Test {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            inner: null,
            extra: null
        };
    }
}