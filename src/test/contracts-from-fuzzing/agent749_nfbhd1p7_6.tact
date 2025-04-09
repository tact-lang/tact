contract TestContract {
    f1: Int as uint8 = 1;
    f2: Int as int16 = -50;
    f3: Int as coins = 1000000000;
    f4: Int as uint4 = 7;
    f5: Bool = true;

    init() {
        self.f1 = 2;
        self.f2 = -30;
        self.f3 = 2000000000;
        self.f4 = 15;
        self.f5 = false;
    }

    receive() {
        let _ = self.f1;
    }
}