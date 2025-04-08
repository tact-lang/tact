struct ComposeOpt {
    inner: Int?;
}

contract ComposeFieldOpt {
    s: ComposeOpt;
    init() {
        self.s = ComposeOpt{ inner: null };
    }
}