struct OptionalDeep {
    a: Int?;
    b: OptionalInner?;
}

struct OptionalInner {
    x: Int;
    y: Bool?;
}

contract OptionalDeepTest {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{
            a: null,
            b: OptionalInner{ x: 5, y: null }
        };
    }
}