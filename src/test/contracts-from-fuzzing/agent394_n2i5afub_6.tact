contract TestContract {
    bit1: Bool = false;
    bit2: Bool = true;
    bit3: Bool = false;
    bit4: Bool = true;
    num1: Int as uint4 = 1;
    num2: Int as uint4 = 2;

    init() {
        self.bit1 = true;
        self.bit2 = false;
        self.bit3 = true;
        self.bit4 = false;
        self.num1 = 3;
        self.num2 = 4;
    }
}