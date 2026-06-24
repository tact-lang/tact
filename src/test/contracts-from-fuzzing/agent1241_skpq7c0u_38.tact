struct HasRemOpt {
    a: Int;
    rest: Slice as remaining;
}

struct EmbedOpt {
    x: HasRemOpt?;
    y: Int;
}

contract OptRemTest {
    data: EmbedOpt;

    init() {
        self.data = EmbedOpt{
            x: null,
            y: 7,
        };
    }
}
