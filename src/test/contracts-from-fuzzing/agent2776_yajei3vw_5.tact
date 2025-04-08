struct Embed {
    a: Int;
    b: Bool;
}

struct Embed2 {
    c: String;
    d: Bool?;
    e: Embed;
}

contract EmbedContract {
    e2: Embed2;

    init() {
        self.e2 = Embed2{
            c: "x", d: null, e: Embed{ a: 1, b: true }
        };
    }
}
