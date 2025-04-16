struct DefaultOpt {
    a: Int?;
    b: Bool?;
}

contract DefOpt {
    inner: DefaultOpt;

    init() {
        self.inner = DefaultOpt{
            a: null, b: null
        };
    }
}