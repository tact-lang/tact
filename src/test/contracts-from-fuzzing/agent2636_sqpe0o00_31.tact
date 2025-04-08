contract MixWithDefaults {
    f1: Int = 10;
    f2: Bool? = null;
    f3: String = "hi";
    f4: Address;
    f5: Cell;

    init() {
        self.f4 = myAddress();
        self.f5 = emptyCell();
    }
}