struct EmbedBoolOpt {
    b: Bool?;
}

contract BoolOptWrap {
    s: EmbedBoolOpt;
    init() {
        self.s = EmbedBoolOpt{ b: null };
    }
}