struct Embed {
    a: Int;
    b: Bool;
}

contract ListEmbed {
    e0: Embed;
    e1: Embed;
    e2: Embed;

    init() {
        self.e0 = Embed{a: 0, b: false};
        self.e1 = Embed{a: 1, b: true};
        self.e2 = Embed{a: 2, b: false};
    }
}