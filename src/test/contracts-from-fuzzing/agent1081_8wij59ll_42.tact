struct SDefOpt {
    a: Int?;
    b: Bool = false;
}

contract DefOptMix {
    s: SDefOpt;

    init() {
        self.s = SDefOpt{ a: null };
    }
}