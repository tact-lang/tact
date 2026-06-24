contract OptDefaultsMix {
    a: Int = 1;
    b: Int? = null;
    c: Bool? = true;

    init() {
        self.b = 5;
        self.c = false;
    }
}