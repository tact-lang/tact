struct InnerLayer {
    a: Int;
    b: Bool;
}

struct WrapperLayer {
    x: InnerLayer;
    y: InnerLayer;
}

contract MultipleNestedWrappers {
    data: WrapperLayer;

    init() {
        self.data = WrapperLayer{
            x: InnerLayer{ a: 1, b: true },
            y: InnerLayer{ a: 2, b: false },
        };
    }
}
