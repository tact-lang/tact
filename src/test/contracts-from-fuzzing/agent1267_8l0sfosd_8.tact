contract OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}

contract U {
    receive() {
        let dummy: OnlyOptionals? = null;
    }
}