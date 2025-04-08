struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedComboPersistent {
    cc: Combo;
    
    init() {
        self.cc = Combo{ a: 1, b: false, c: "x", d: null, e: null, f: null };
    }
}