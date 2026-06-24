contract TestContract {
    f1: Int? = null;
    f2: Int? = 5;
    f3: String? = null;
    f4: String? = "abc";
    f5: Bool? = null;
    f6: Bool? = true;
    
    init() {
        self.f1 = 42;
        self.f2 = null;
        self.f3 = "zzz";
        self.f4 = null;
        self.f5 = false;
        self.f6 = null;
    }
    receive() { let x = self.f3; }
}