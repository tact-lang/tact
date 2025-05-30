contract PartiallyDefaulted {
    f1: Int;
    f2: Int = 7;

    init() {
        self.f1 = 100;
    }
}
