struct Rec1 { a: Int; }
struct Rec2 { b: Rec1; }
struct Rec3 { c: Rec2; }

contract DeepFlattenNested {
    rec3: Rec3;
    init() {
        self.rec3 = Rec3{ c: Rec2{ b: Rec1{ a: 42 } } };
    }
}
