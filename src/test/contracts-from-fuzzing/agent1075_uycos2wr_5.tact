contract ManyFieldsContract {
    f1: Int = 1;
    f2: Int = 2;
    f3: Bool = true;
    f4: Bool = false;
    f5: String = "a";
    f6: String = "b";
    f7: Int? = null;
    f8: Bool? = null;
    f9: String? = null;
    f10: Int = 10;

    init() {
        self.f1 = 11;
    }
}