contract DefaultInFields {
    a: Int = 5;
    b: Bool = false;
    c: String = "text";
    d: Int?;

    init() {
        self.d = null;
    }
}