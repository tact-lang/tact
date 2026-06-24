contract MixedSerializations {
    f1: Int as uint32;
    f2: Int as int64;
    f3: Int;
    f4: Int as int257;

    init() {
        self.f1 = 5;
        self.f2 = -1234567;
        self.f3 = 0;
        self.f4 = 987654321;
    }
}