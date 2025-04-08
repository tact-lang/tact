contract MixOfEverything {
    ia: Int;
    ib: Int as uint32;
    f: Bool;
    s: String;
    oia: Int?;
    os: String?;
    ob: Bool?;

    init() {
        self.ia = 1;
        self.ib = 2;
        self.f = true;
        self.s = "abc";
        self.oia = null;
        self.os = "def";
        self.ob = false;
    }
}
