contract ManyOptionals {
    oi1: Int?;
    oi2: Bool?;
    oi3: String?;
    oi4: Address?;
    oi5: Cell?;

    init() {
        self.oi1 = null;
        self.oi2 = true;
        self.oi3 = null;
        self.oi4 = null;
        self.oi5 = null;
    }
}