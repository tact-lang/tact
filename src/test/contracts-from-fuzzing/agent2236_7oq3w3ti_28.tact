contract OptDefaultMix {
    a: Int?;
    b: Int = 0;
    c: Bool?;
    d: Bool = true;

    init() {
        self.a = null;
        self.c = null;
    }
}