struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract ComboTest {
    f: Combo;

    init() {
        self.f = Combo { a:1, b:false, c:null, d:true, e:"hi", f:null };
    }
}