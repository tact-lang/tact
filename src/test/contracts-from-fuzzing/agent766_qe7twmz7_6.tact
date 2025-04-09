struct InnerOptional {
    value: Int?;
}

struct MiddleOptional {
    inner: InnerOptional?;
}

contract OptionalStructNest {
    data: MiddleOptional? = null;

    init() {
        self.data = MiddleOptional{
            inner: InnerOptional{ value: 123 }
        };
    }
}