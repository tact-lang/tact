struct EmbeddedOptional {
    v: Int?;
}

contract OptOnOptField {
    e: EmbeddedOptional?;
    init() {
        self.e = EmbeddedOptional{v:123};
    }
}