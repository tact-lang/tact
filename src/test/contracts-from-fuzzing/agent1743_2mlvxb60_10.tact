contract DefaultOptionals {
    a: Int?;
    b: Int? = null;

    init() {
        self.a = null;
        self.b = null;
    }
}