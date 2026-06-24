struct Rec1 { val: Int }
struct Rec2 { rec1: Rec1 }
struct Rec3 { rec2: Rec2 }

contract SerialNested {
    r: Rec3;

    init() {
        self.r = Rec3{ rec2: Rec2{ rec1: Rec1{ val: 99 } } };
    }
}