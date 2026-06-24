message(0xCAFEBABE) BigMsg {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "A";
    f4: Int? = null;
    f5: Bool? = null;
    f6: String = "B";
    f7: Int = 7;
    f8: Bool = true;
    f9: String = "C";
    f10: Int? = 10;
    f11: Bool? = true;
    f12: String = "D";
}

contract TestContract {
    m: BigMsg;

    init() {
        self.m = BigMsg{};
    }
}