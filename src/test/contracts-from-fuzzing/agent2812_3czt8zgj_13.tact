struct InnerA {
    x: Int;
}

struct InnerB {
    y: Bool;
}

struct MultiEmbed {
    a: InnerA;
    b: InnerB;
}

contract EmbedMany {
    data: MultiEmbed;

    init() {
        self.data = MultiEmbed{ a: InnerA{ x: 5 }, b: InnerB{ y: true } };
    }
}