struct DefaultedInner {
    foo: Int = 5;
}

struct WrapperOpt {
    inner: DefaultedInner?;
}

contract DefaultNestedOpt {
    data: WrapperOpt;

    init() {
        self.data = WrapperOpt{
            inner: null
        };
    }
}