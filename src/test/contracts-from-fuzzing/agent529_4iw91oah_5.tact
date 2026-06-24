struct S { a: Int; b: Bool }

contract ManyFields {
    f1: S; f2: S; f3: S; f4: S; f5: S; f6: S; f7: S; f8: S; f9: S; f10: S;

    init() {
        self.f1 = S{ a: 1, b: true };
        self.f2 = S{ a: 2, b: false };
        self.f3 = S{ a: 3, b: true };
        self.f4 = S{ a: 4, b: false };
        self.f5 = S{ a: 5, b: true };
        self.f6 = S{ a: 6, b: false };
        self.f7 = S{ a: 7, b: true };
        self.f8 = S{ a: 8, b: false };
        self.f9 = S{ a: 9, b: true };
        self.f10 = S{ a: 10, b: false };
    }
}