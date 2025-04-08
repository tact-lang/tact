struct Rec1 { r2: Rec2? }
struct Rec2 { r3: Rec3? }
struct Rec3 { val: Int }

contract RecursionContract {
    rec: Rec1;

    init() {
        self.rec = Rec1{ r2: Rec2{ r3: Rec3{ val: 999 } } };
    }
}
