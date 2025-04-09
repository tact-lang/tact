struct Embed {
    i: Int;
}

contract ManyEmbed {
    a: Embed;
    b: Embed;
    c: Embed;

    init() {
        self.a = Embed{i:1};
        self.b = Embed{i:2};
        self.c = Embed{i:3};
    }
}