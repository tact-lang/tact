struct S1 { f1: Int }
struct S2 { f2: Bool }
struct S3 { f3: String }
struct S4 { f4: Address }
struct S5 { f5: Cell }
struct S6 { f6: Slice }
struct S7 { f7: Builder }

contract ManySmallStructs {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;
    s7: S7;

    init() {
        self.s1 = S1{ f1: 1 };
        self.s2 = S2{ f2: true };
        self.s3 = S3{ f3: "hello" };
        self.s4 = S4{ f4: myAddress() };
        self.s5 = S5{ f5: emptyCell() };
        self.s6 = S6{ f6: emptyCell().asSlice() };
        self.s7 = S7{ f7: beginCell() };
    }
}