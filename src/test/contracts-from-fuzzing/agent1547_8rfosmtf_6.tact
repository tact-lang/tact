contract ManyFieldsContract {
    f1: Int = 1;
    f2: Int = 2;
    f3: Bool = true;
    f4: Bool = false;
    f5: String = "A";
    f6: String = "B";
    f7: Address;
    f8: Int?;
    f9: Bool?;
    f10: String = "End";

    init() {
        self.f7 = myAddress();
        self.f8 = null;
        self.f9 = null;
    }
}