struct HasOptional {
    x: Int?;
}

contract OuterHasOption {
    inner: HasOptional;

    init() {
        self.inner = HasOptional{ x: null };
    }
}
