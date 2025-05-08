contract DefaultAndNoDefault {
    a: Int = 10;
    b: String;
    c: Bool?;

    init() {
        self.b = "set";
        self.c = null;
    }
}