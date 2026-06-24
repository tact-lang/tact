contract WeirdOrder {
    f4: Int = 4;
    f1: Int = 1;
    f3: String = "s";
    f2: Bool = false;

    init() {
        self.f1 = 10;
        self.f2 = true;
        self.f3 = "x";
        self.f4 = 20;
    }
}
// fields initialized out of declaration order, to test ordering in persistence