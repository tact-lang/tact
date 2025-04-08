contract WithManyStringOpt {
    a: String? = null;
    b: String? = null;
    c: String? = null;
    d: String? = null;

    init() {
        self.a = "a";
        self.b = null;
        self.c = "c";
        self.d = "d";
    }
}