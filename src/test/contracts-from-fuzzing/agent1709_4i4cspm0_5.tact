struct OptInner {
    b: Bool;
}

struct OptOuter {
    innerOpt: OptInner?;
    s: String;
}

contract OptionalStructInsideStruct {
    top: OptOuter;

    init() {
        self.top = OptOuter{
            innerOpt: null,
            s: "hi"
        };
    }
}