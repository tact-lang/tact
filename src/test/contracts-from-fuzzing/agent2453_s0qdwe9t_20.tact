contract ManyDefaults {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "abc";
    f4: Int? = null;
    f5: Bool? = null;
    f6: String? = null;
    init() {
        self.f1=2;
        self.f2=true;
        self.f3="def";
        self.f4=3;
        self.f5=false;
        self.f6="ghi";
    }
}