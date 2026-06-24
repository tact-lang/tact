struct MultiLayer {
    a: Int;
    b: Bool;
}

struct WrapperLayer {
    ml: MultiLayer;
    optMl: MultiLayer?;
}

contract Test22 {
    data: WrapperLayer;

    init() {
        self.data = WrapperLayer{
            ml: MultiLayer{ a: 1, b: true },
            optMl: null
        };
    }
}