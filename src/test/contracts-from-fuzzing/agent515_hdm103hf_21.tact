struct Inner {
    flag: Bool;
}

contract OptChain {
    x: Int?;
    inn: Inner?;
    s: String?;

    init() {
        self.x = 2;
        self.inn = null;
        self.s = null;
    }
}
