struct Rec1 {
    val: Int;
}

struct Rec2 {
    rec1: Rec1;
    opt: Bool?;
}

contract RecursionField {
    data: Rec2;
    init() {
        self.data = Rec2{ rec1: Rec1{ val: 5 }, opt: null };
    }
}