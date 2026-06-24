struct Embed {
    x: Int;
}

contract EmbedTest {
    a: Embed;

    init() {
        self.a = Embed{ x:1 };
    }
}