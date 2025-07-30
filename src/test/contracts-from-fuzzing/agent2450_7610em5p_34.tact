// Shallow optionals chain embedded inside contract state
struct InnerOpt {
    v: Int?;
}

contract WrapOpt {
    inner: InnerOpt?;
    init() {
        self.inner = null;
    }
}
