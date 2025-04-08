struct Rec1 { a: Int }

struct Rec2 {
    rec1: Rec1;
    opt: Rec1?;
}

struct Rec3 {
    rec2: Rec2;
}

contract Recursive {
    data: Rec3;
    init() {
        self.data = Rec3{ rec2: Rec2{ rec1: Rec1{ a: 1 }, opt: null } };
    }
}