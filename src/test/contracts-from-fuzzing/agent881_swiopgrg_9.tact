struct Embed {
    s: String;
    b: Bool;
}

struct EmbedOpt {
    e: Embed?;
    x: Int?;
    y: String?;
}

contract TestEmbedOpt {
    complex: EmbedOpt;

    init() {
        self.complex = EmbedOpt{
            e: null,
            x: null,
            y: null
        };
    }
}