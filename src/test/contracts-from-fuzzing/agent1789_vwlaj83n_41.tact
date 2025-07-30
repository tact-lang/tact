struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComboMany {
    c1: Combo;
    c2: Combo;

    init() {
        self.c1 = Combo{ a:1, b:true, c:"x", d:null, e:null, f:null };
        self.c2 = Combo{ a:2, b:false, c:"y", d:null, e:null, f:null };
    }
}