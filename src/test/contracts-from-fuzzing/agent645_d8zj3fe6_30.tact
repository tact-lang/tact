struct SOptInner {
    opt: Int?;
}

struct SContain {
    nested: SOptInner?;
}

contract ContainOptional {
    s: SContain;

    init() {
        self.s = SContain{ nested: null };
    }
}
