contract ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";
    ai: Int?;
    bi: Bool?;
    si: String?;

    init() {
        self.ai = null;
        self.bi = null;
        self.si = null;
    }
}