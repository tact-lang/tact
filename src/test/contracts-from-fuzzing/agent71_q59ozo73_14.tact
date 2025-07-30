struct InnerOptional {
    foo: Bool?;
}

struct Wrapper {
    inner: InnerOptional;
}

contract InnerOptionalContract {
    wrapped: Wrapper;
    init() {
        self.wrapped = Wrapper{
            inner: InnerOptional{ foo: null }
        };
    }
}