contract TestContract {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "a";
    f4: Int = 4;
    f5: String = "b";
    f6: Bool = false;
    f7: Address;
    f8: Int = -8;
    f9: String = "c";
    f10: Bool = true;
    
    init() {
        self.f7 = myAddress();
    }
}