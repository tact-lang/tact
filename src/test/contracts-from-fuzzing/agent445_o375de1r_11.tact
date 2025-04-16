struct OptionalDeepInner {
    p: Int?;
}

struct MiddleOpt {
    optInner: OptionalDeepInner?;
}

contract OptStructDeep {
    data: MiddleOpt;

    init() {
        self.data = MiddleOpt{
            optInner: OptionalDeepInner{
                p: null
            }
        };
    }
}
