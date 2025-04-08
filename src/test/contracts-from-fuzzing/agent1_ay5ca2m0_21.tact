struct OptionalStructWithDeep {
    inner: SInner?;
}

struct SInner {
    value: Int;
    name: String;
}

contract OptionalDeepTest {
    data: OptionalStructWithDeep;

    init() {
        self.data = OptionalStructWithDeep{
            inner: null
        };
    }
}
