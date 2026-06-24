struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract CombinedOptionalAndDefault {
    c: Combo;

    init() {
        self.c = Combo{ a:1, b:true, c:"x", d:null, e:null, f:null };
    }
}