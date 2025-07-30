contract DefaultsAndNulls {
    n: Int = 1;
    o: Int?;
    p: Int? = 2;
    q: Int?;

    init() {
        self.o = null;
        self.q = null;
    }
}