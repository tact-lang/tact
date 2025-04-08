contract AbnormalOptional {
    a: Int? = null;
    b: Int?;
    c: Int?;

    init() {
        self.b = null;
        self.c = 123;
    }
}