contract TestContract {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;

    init() {
        self.flag1 = true;
        self.flag2 = false;
        self.flag3 = true;
        self.flag4 = false;
    }

    receive() {
        let _ = self.flag1;
        let _ = self.flag2;
        let _ = self.flag3;
        let _ = self.flag4;
    }
}