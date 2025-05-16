struct InnerOptional {
    value: Int?;
}

struct Wrapper {
    inner: InnerOptional?;
}

contract OptionalStructInOptional {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: null
        };
    }
}