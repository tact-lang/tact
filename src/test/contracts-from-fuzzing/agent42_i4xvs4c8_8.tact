struct EmbeddedWithOptionals {
    x: Int?;
    y: Bool?;
}

struct HasEmbedded {
    f1: EmbeddedWithOptionals;
    f2: EmbeddedWithOptionals?;
}

contract EmbeddedStructs {
    data: HasEmbedded;

    init() {
        self.data = HasEmbedded{
            f1: EmbeddedWithOptionals{ x: 1, y: true },
            f2: null
        };
    }
}