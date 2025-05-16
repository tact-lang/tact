struct Rec1 { a: Int }
struct Rec2 { r1: Rec1 }
struct Rec3 { r2: Rec2 }
struct Rec4 { r3: Rec3 }
struct Rec5 { r4: Rec4 }
struct Rec6 { r5: Rec5 }

contract OptRec6 {
    v: Rec6?;
}