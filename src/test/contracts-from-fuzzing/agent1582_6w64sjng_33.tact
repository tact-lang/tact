struct ComposeEmbedded {
    a: Int;
    b: Bool;
}

struct HasEmbedded {
    e: ComposeEmbedded;
    s: String;
}

contract EmbeddedStructTest {
    v: HasEmbedded;
    init() {
        self.v = HasEmbedded{e:ComposeEmbedded{a:3,b:true},s:"ok"};
    }
}