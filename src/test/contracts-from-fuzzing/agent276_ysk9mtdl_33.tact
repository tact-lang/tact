struct EmbedOne {
    x: Int;
}

struct EmbedTwo {
    e1: EmbedOne;
    y: Int;
}

contract EmbedChain {
    item: EmbedTwo;

    init() {
        self.item = EmbedTwo{
            e1: EmbedOne{x: 1},
            y: 2
        };
    }
}
