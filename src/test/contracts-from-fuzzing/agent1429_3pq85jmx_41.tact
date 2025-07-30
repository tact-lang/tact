struct EmbedOpt {
    f: Int?;
}

struct WrapOpt {
    embed: EmbedOpt?;
}

contract ContainsWrapOpt {
    wrap: WrapOpt;

    init() {
        self.wrap = WrapOpt{ embed: null };
    }
}