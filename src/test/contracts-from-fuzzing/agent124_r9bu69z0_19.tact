struct EmbeddedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptEmbed {
    data: EmbeddedOptionals;
    init() {
        self.data = EmbeddedOptionals{ a:null, b:null, c:null };
    }
}