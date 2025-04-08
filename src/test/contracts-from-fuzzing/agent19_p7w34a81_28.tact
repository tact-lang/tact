struct OptionInner {
    val: Int?;
}

struct WrapperOpt {
    inner: OptionInner?;
    other: String;
}

contract OptionalLayered {
    wrapped: WrapperOpt;

    init() {
        self.wrapped = WrapperOpt{
            inner: null,
            other: "yo",
        };
    }
}