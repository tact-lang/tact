struct Combo {
    a: Int;
    b: String?;
    c: Bool;
    d: String;
    e: Int?;
}

contract ComboTypes {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1,
            b:null,
            c:true,
            d:"data",
            e:null
        };
    }
}