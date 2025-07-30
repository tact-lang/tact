contract IntDefaultOpt {
    a: Int? = null;
    b: Int? = 42;
    c: Int?;

    init() {
        self.c = 50;
    }
}