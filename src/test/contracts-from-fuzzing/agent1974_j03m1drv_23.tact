struct Deeply {
    val: Int;
    opt: Int?;
    flag: Bool;
}

contract ManyKind {
    a1: Deeply;
    a2: Deeply?;
    a3: Deeply;
    a4: Deeply?;

    init() {
        self.a1 = Deeply{ val:1, opt:null, flag:true };
        self.a2 = null;
        self.a3 = Deeply{ val:2, opt:3, flag:false };
        self.a4 = null;
    }
}
