struct Defaults10 {
    f0: Int = 0;
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "hi";
    f4: Int as uint8 = 42;
    f5: Bool = true;
    f6: Int = -5;
    f7: String = "";
    f8: Int = 99;
    f9: Int = 100;
}

contract DefVals {
    s: Defaults10;

    init() {
        self.s = Defaults10{};
    }
}