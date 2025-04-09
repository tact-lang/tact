struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalContract {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: String?;
    s: ManyOptionals;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
        self.s = ManyOptionals{ a:null, b:null, c:null, d:null };
    }
}