struct Rec1 { f: Rec2; }
struct Rec2 { f: Rec3; }
struct Rec3 { f: Int; }

contract LongNest {
    st: Rec1;
    init() {
        self.st = Rec1{ f: Rec2{ f: Rec3{ f: 1 } } };
    }
}