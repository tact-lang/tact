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

    receive() {
        if (self.c != null) {
            dump(self.c!!);
        }
    }
}