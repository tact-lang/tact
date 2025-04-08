struct DeepInner {
    a: Int as uint8;
}

struct MiddleOpt {
    inner: DeepInner?;
}

contract ComplicateOptionalSer {
    data: MiddleOpt?;
    init() {
        self.data = MiddleOpt{
            inner: DeepInner{ a: 255 }
        };
    }
}