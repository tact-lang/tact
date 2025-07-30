contract InitPartial {
    a: Int;
    b: Bool = true;
    c: String;

    init() {
        self.a = 9;
        self.c = "zzz";
    }
}