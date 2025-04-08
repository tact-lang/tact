struct Embedded {
    flag: Bool;
    text: String;
}

struct ContainsEmbedded {
    emb: Embedded?;
    val: Int;
}

contract NestedOptionalEmbed {
    opt: ContainsEmbedded?;

    init() {
        self.opt = null;
    }
}