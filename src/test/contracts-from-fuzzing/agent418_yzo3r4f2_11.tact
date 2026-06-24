contract ManyOptionals {
    f1: Int? = null;
    f2: Bool? = null;
    f3: String? = null;
    f4: Int? = null;
    f5: Bool? = null;
    f6: String? = null;
    f7: Int? = null;
    f8: Bool? = null;
    f9: String? = null;

    receive() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = 4;
        self.f5 = false;
        self.f6 = "f";
        self.f7 = 7;
        self.f8 = true;
        self.f9 = "i";
    }
}