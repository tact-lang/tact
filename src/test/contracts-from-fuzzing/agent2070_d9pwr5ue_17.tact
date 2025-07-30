struct InnerOpt {
    flag: Bool?;
}

contract OptionalStructInside {
    inner: InnerOpt?;

    init() {
        self.inner = InnerOpt{
            flag: true
        };
    }
}