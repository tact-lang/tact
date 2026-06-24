struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract ComboTypesTest {
    cval: Combo;

    init() {
        self.cval = Combo{
            a:1, b:null, c:true, d:null, e:"hi", f:null
        };
    }
}