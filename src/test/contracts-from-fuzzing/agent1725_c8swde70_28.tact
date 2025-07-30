struct Embed {
    a: Int;
    b: Bool;
    c: String?;
}

contract EmbedMany {
    e1: Embed;
    e2: Embed;
    e3: Embed;

    init() {
        self.e1 = Embed{ a:1, b:true, c:null };
        self.e2 = Embed{ a:2, b:false, c:null };
        self.e3 = Embed{ a:3, b:true, c:"str" };
    }
}