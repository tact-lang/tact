struct Embed {
    s: String;
}

contract OptionalStruct {
    emb: Embed?;
    init() {
        self.emb = Embed{ s: "abc" };
    }
}
