struct SOpt {
    alpha: Int?;
    beta: String?;
}

contract InlineOpt {
    inner: SOpt?;

    init() {
        self.inner = SOpt{
            alpha: null,
            beta: null,
        };
    }
}
