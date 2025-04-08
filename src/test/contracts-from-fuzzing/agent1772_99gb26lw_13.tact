struct Combo {
    num: Int;
    flg: Bool?;
    msg: String;
}

contract Test13 {
    a: Combo; // nested struct
    b: Int;
    c: String?;

    init() {
        self.a = Combo{ num: 5, flg:null, msg:"hi" };
        self.b = 42;
        self.c = "yy";
    }
}