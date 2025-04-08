struct Embed {
    a: Int;
}

contract EmbeddedStructs {
    a: Embed;
    b: Embed;
    c: Embed;

    init() {
        self.a = Embed{a:1};
        self.b = Embed{a:2};
        self.c = Embed{a:3};
    }
}