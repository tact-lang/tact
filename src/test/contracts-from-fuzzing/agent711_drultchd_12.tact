struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

struct Wrapper {
    inner: OptionalInner;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: OptionalInner{
                foo: null,
                bar: null,
            },
        };
    }
}