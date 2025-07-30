struct OptionalDeep {
    inner: InnerDeep?;
}

struct InnerDeep {
    value: Int;
}

contract OptionalHolderTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: null
        };
    }
}