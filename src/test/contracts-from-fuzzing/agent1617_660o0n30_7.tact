struct OptInner {
    x: Int?;
    s: String?;
}

struct OptOuter {
    innerOpt: OptInner?;
    flagOpt: Bool?;
}

contract DeepOptionalTest {
    d: OptOuter;

    init() {
        self.d = OptOuter{
            innerOpt: OptInner{ x: 10, s: null },
            flagOpt: null
        };
    }
}
