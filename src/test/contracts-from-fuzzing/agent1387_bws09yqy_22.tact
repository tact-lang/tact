struct InnerOpt {
    a: Int?;
    b: Bool;
}

contract OptStructContract {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{
            a: null,
            b: true
        };
    }
}