struct SomeData {
    x: Int;
    y: Bool;
}

contract LargeFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: SomeData;
    f6: SomeData;
    f7: SomeData;
    f8: SomeData;
    f9: SomeData;
    f10: SomeData;
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = false;
        self.f5 = SomeData{x: 1, y: true};
        self.f6 = SomeData{x: 2, y: false};
        self.f7 = SomeData{x: 3, y: true};
        self.f8 = SomeData{x: 4, y: false};
        self.f9 = SomeData{x: 5, y: true};
        self.f10 = SomeData{x: 6, y: false};
    }
}