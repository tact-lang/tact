struct Wrapped {
    a: InnerWrap;
    b: InnerWrap;
}
struct InnerWrap {
    x: Int?;
    y: Bool;
}

contract WrappingOpt {
    d: Wrapped;

    init() {
        self.d = Wrapped{
            a: InnerWrap{ x: null, y: true },
            b: InnerWrap{ x: 2, y: false }
        };
    }
}