struct DeepOpt {
    x: Int?;
    y: Int?;
}

struct WrapOpt {
    inner: DeepOpt?;
}

contract OptionalInsideOptional {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{ inner: null };
    }

    receive() {
        self.data.inner = DeepOpt{ x: 99, y: null };
    }
}