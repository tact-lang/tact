struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct WrapperOpt {
    inner: DeepOptionals?;
}

struct WrappingLayer {
    nested: WrapperOpt?;
}

contract MultipleNullableLayers {
    val: WrappingLayer;

    init() {
        self.val = WrappingLayer{nested:null};
    }
}