struct Wrapper {
    inner: WrappedOpt;
}

struct WrappedOpt {
    foo: Int?;
    bar: String?;
}

contract MultiWrap {
    obj: Wrapper;

    init() {
        self.obj = Wrapper{
            inner: WrappedOpt{
                foo: null,
                bar: null
            }
        };
    }
}