struct MayBe {
    enabled: Bool?;
}

contract DefaultNullOpt {
    cfg: MayBe;

    init() {
        self.cfg = MayBe{};
    }
}