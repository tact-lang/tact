struct Base {
    x: Int;
    y: Int?;
    flag: Bool;
}

contract ComboStorage {
    a: Base;
    b: Base?;
    c: Base;
    d: Base?;

    init() {
        self.a = Base{ x:1, y:null, flag:true };
        self.b = null;
        self.c = Base{ x:2, y:3, flag:false };
        self.d = null;
    }
}
