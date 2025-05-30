struct Rec1 {
    val: Int;
}

struct Rec2 {
    r1: Rec1;
}

struct Rec3 {
    r2: Rec2;
}

struct Rec4 {
    r3: Rec3;
}

contract DeepRecursion {
    field: Rec4;
    init() {
        self.field = Rec4{ r3: Rec3{ r2: Rec2{ r1: Rec1{ val: 101 } } } };
    }
}