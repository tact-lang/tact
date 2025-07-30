struct Embed {
    a: Int;
    b: Bool;
}

contract EmbedStructTest {
    data: Embed;

    init() {
        self.data = Embed { a: 1, b: true };
    }
}