contract ManyFields {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Int = 6;
    f7: Bool = true;
    f8: Bool = false;
    f9: String = "a";
    f10: String = "b";
    f11: Address;
    init() {
        self.f11 = myAddress();
    }
}