struct OuterOpt {
    inner: Int?;
}

contract JustOuterOpt {
    value: OuterOpt?;

    init() {
        self.value = null;
    }
}
