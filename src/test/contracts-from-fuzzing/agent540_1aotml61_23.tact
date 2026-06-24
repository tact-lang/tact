struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract AllOptionals {
    oo: OnlyOptionals;

    init() {
        self.oo = OnlyOptionals{ a:null, b:null, c:null, d:null };
    }
}