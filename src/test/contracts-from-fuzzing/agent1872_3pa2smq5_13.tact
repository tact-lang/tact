struct EmbedOpt {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalEmbedded {
    val: EmbedOpt;

    init() {
        self.val = EmbedOpt{
            s: null,
            b: null,
            i: null,
        };
    }
}