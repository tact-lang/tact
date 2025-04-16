contract DefaultsVsInit {
    num1: Int = 13;
    num2: Int;
    flag: Bool = true;
    addr: Address;

    init() {
        self.num2 = 42;
        self.addr = myAddress();
    }
}