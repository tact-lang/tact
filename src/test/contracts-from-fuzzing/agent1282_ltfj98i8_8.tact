struct ComposeOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptPersistent {
    f1: ComposeOpt?;
    f2: ComposeOpt?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}