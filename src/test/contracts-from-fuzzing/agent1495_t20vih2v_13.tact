struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Rec1;
}

struct Rec3 {
    c: Rec2;
}

contract RecKeep {
    k: Rec3?;

    init() {
        self.k = Rec3{ c: Rec2{ b: Rec1{ a: 5 } } };
    }
}