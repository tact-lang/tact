contract NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }

    get fun info(): String {
        if (self.c != null) {
            return self.c!!;
        }
        return "none";
    }
}
