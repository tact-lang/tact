struct S1 { a: Int; }
struct S2 { s: S1; }
struct S3 { s: S2; }

contract ManyOptionals {
    f1: S3?;
    f2: S2?;
    f3: S1?;
    f4: Int?;
    f5: Bool?;
    f6: Address?;
    f7: Slice?;
    f8: Cell?;
    f9: String?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
    }
}
