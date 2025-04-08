struct Arr {
    a: Int;
    b: Bool;
}

contract LongList {
    f1: Arr;
    f2: Arr;
    f3: Arr;
    f4: Arr;
    f5: Arr;
    f6: Arr;
    f7: Arr;
    f8: Arr;
    f9: Arr;
    f10: Arr;

    init() {
        let x = Arr{ a: 1, b: true };
        self.f1 = x; self.f2 = x; self.f3 = x; self.f4 = x;
        self.f5 = x; self.f6 = x; self.f7 = x; self.f8 = x;
        self.f9 = x; self.f10 = x;
    }
}