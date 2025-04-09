struct OptionalDeep {
    inner: OptionalInner?;
}

struct OptionalInner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: OptionalInner{
                x: null,
                y: null,
                z: null
            }
        };
    }
}