struct OptNest {
    x: Int?;
    y: Bool?;
}

struct WrapOpt {
    inner: OptNest?;
    foo: Int;
}

contract OptionalStructNest {
    w: WrapOpt;

    init() {
        self.w = WrapOpt{
            inner: null,
            foo: 100
        };
    }
}