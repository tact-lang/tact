struct Embed {
    xx: Int;
    yy: Bool?;
}

contract EmbedDefault {
    e: Embed = Embed{ xx: 1, yy: null };

    init() {
        self.e = Embed{ xx: 2, yy: true };
    }
}