struct Rec1 { a: Int; }
struct Rec2 { r1: Rec1; }
struct Rec3 { r2: Rec2; }
struct Rec4 { r3: Rec3; }
struct Rec5 { r4: Rec4; }
struct Rec6 { r5: Rec5; }
struct Rec7 { r6: Rec6; }
struct Rec8 { r7: Rec7; }
struct Rec9 { r8: Rec8; }
struct Rec10 { r9: Rec9; }

contract RecursionTest {
    rec: Rec10;

    init() {
        self.rec = Rec10{ r9: Rec9{ r8: Rec8{ r7: Rec7{ r6: Rec6{ r5: Rec5{ r4: Rec4{ r3: Rec3{ r2: Rec2{ r1: Rec1{ a: 44 } } } } } } } } } };
    }
}