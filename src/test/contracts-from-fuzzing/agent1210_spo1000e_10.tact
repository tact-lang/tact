contract ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: String?;
    f5: Cell?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = myAddress();
        self.f4 = "abc";
        self.f5 = emptyCell();
    }
}