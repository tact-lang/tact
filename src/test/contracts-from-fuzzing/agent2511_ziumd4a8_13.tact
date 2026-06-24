struct SOptS {
    inner: String?;
}

contract DefaultOpt {
    s: SOptS;

    init() {
        self.s = SOptS{};
    }
}