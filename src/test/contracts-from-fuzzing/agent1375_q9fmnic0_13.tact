struct Embeds {
    nested: Nested;
}

struct Nested {
    a: Int;
    b: String;
    c: Bool;
}

contract EmbedContract {
    val: Embeds;

    init() {
        self.val = Embeds{ nested: Nested{ a: 3, b: "ok", c: true } };
    }
}