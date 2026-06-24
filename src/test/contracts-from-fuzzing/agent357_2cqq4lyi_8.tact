struct OptionalDeep {
    inner: OptionalInner?;
}

struct OptionalInner {
    flag: Bool;
}

contract OptionalDeepStorage {
    value: OptionalDeep;

    init() {
        self.value = OptionalDeep{
            inner: null,
        };
    }
}