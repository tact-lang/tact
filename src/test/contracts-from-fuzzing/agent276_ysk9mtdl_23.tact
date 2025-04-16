struct DeepEmbedded {
    a: Int;
    b: Int;
}

struct NestedEmbed {
    x: DeepEmbedded;
    y: Int;
}

contract EmbedVars {
    item: NestedEmbed;

    init() {
        self.item = NestedEmbed{
            x: DeepEmbedded{a:1,b:2},
            y:3
        };
    }
}
