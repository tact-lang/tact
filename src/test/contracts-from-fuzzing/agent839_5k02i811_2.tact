struct DeepNest {
    lvl1: Int;
    lvl2: Int?;
    lvl3: String?;
    lvl4: Bool?;
}

contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: DeepNest?;
    e: DeepNest;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = DeepNest{lvl1: 1, lvl2: null, lvl3: null, lvl4: null};
    }
}