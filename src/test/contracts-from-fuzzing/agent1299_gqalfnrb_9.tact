struct DeepOption {
    inner: Int?;
}

contract OptOpt {
    wrapped: DeepOption?;

    init() {
        self.wrapped = DeepOption{
            inner: 42
        };
    }
}