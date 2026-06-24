struct TestStruct {
    n: Int;
    s: String;
}

contract LongList {
    f1: TestStruct;
    f2: TestStruct;
    f3: TestStruct;
    f4: TestStruct;
    f5: TestStruct;
    f6: TestStruct;
    f7: TestStruct;
    f8: TestStruct;
    f9: TestStruct;
    f10: TestStruct;
    f11: TestStruct;
    f12: TestStruct;

    init() {
        let val = TestStruct{ n: 1, s: "hi" };
        self.f1 = val;  self.f2 = val;  self.f3 = val; self.f4 = val; self.f5 = val;
        self.f6 = val;  self.f7 = val;  self.f8 = val; self.f9 = val;
        self.f10 = val; self.f11 = val; self.f12 = val;
    }
}