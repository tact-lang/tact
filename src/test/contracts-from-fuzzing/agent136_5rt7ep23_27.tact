struct EmbedOne {
    x: Int;
}

struct EmbedTwo {
    y: EmbedOne;
}

struct EmbedThree {
    z: EmbedTwo;
}

contract DeepEmbed {
    val: EmbedThree;

    init() {
        self.val = EmbedThree{ z: EmbedTwo{ y: EmbedOne{ x: 9 } } };
    }
}