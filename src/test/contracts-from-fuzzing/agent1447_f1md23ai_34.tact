contract BasicContract {
    i: Int;
    s: String;
    b: Bool;
    oi: Int?;
    os: String?;
    ob: Bool?;

    init() {
        self.i = 44;
        self.s = "hello";
        self.b = false;
        self.oi = null;
        self.os = null;
        self.ob = null;
    }
}