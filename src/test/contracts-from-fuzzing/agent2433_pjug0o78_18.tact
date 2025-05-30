struct OptionalStructDeep {
    inner: OptionalInner?;
}

struct OptionalInner {
    deep: OptionalDeeper?;
}

struct OptionalDeeper {
    num: Int?;
}

contract OptionalStructDeepTest {
    data: OptionalStructDeep;

    init() {
        self.data = OptionalStructDeep{
            inner: null
        };
    }
}