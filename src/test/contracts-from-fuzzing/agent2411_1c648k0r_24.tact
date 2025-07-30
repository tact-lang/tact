struct Embed {
    x: Int;
    y: Int?;
}

contract EmbedOptionals {
    e1: Embed?;
    e2: Embed?;

    init() {
        self.e1 = null;
        self.e2 = null;
    }
}