struct EmbeddedOptional {
    a: Int?;
    b: Int?;
}

struct EmbedOuter {
    inner: EmbeddedOptional;
    z: Int;
}

contract OptStructEmbed {
    state: EmbedOuter;

    init() {
        self.state = EmbedOuter{
            inner: EmbeddedOptional{
                a: null,
                b: 20
            },
            z: 77
        };
    }
}