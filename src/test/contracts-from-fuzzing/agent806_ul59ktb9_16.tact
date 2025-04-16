struct DeepOption {
    inner: String?;
}

contract OptionalDeepInside {
    data: DeepOption;

    init() {
        self.data = DeepOption{
            inner: null
        };
    }
}