struct NestOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOpt {
    inner: NestOpt?;
}

contract OptionalLayers {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            inner: NestOpt{ a: null, b: null, c: null }
        };
    }
}