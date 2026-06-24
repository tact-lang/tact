struct OptionalWrap {
    inner: OptionalStruct?;
}

struct OptionalStruct {
    value: Int;
}

contract TestContract {
    maybeInner: OptionalWrap;

    init() {
        self.maybeInner = OptionalWrap{
            inner: null,
        };
    }
}