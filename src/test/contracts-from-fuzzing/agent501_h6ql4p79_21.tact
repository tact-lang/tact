struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract ComboField {
    val: Combo;

    init() {
        self.val = Combo{ a:1, b:true, c:"qq", d:null, e:false, f:null };
    }
}