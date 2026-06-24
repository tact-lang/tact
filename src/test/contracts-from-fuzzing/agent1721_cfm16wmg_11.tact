struct OptionalEmbedded {
    x: Int?;
}

struct HasOptionalEmbedded {
    oe: OptionalEmbedded;
}

contract EmbeddedOptionTest {
    data: HasOptionalEmbedded;

    init() {
        self.data = HasOptionalEmbedded{
            oe: OptionalEmbedded{
                x: null
            }
        };
    }
}