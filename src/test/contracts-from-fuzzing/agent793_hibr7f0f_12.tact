struct Embed {
    a: Int;
    b: Bool;
}

contract InlineEmbed {
    e: Embed;
    b: Bool;
    init() {
        self.e = Embed{ a: 1, b: false };
        self.b = true;
    }
}