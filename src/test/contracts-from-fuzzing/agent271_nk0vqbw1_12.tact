struct NestOpt {
    f1: Int?;
    f2: Bool;
}

contract TestContract {
    inner: NestOpt?;

    init() {
        self.inner = NestOpt{
            f1: null,
            f2: true
        };
    }
}