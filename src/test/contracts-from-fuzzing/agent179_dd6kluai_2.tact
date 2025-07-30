struct Inner {
    a: Int;
    b: Bool?;
}

struct Wrapper {
    inner: Inner;
    s: String?;
    n: Int;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: Inner{ a: 5, b: null },
            s: null,
            n: 10,
        };
    }
}