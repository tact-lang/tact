struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct WrapOpt {
    inner: DeepOpt?;
}

contract OptionalInOptional {
    data: WrapOpt?;

    init() {
        self.data = null;
    }
}