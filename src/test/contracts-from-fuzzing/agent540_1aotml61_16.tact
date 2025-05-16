contract EmptyAndOptionalMix {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: String = "";

    init() {
        self.a = 3;
        self.b = true;
        self.c = null;
        self.d = "d";
    }
}