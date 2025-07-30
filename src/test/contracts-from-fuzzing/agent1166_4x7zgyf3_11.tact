contract FieldOrderingTest {
    f1: Int as int64;
    f2: Bool;
    f3: String;
    f4: Int as uint8;
    f5: Bool;
    f6: Int;

    init() {
        self.f1 = 123;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = 42;
        self.f5 = false;
        self.f6 = 1000;
    }
}
