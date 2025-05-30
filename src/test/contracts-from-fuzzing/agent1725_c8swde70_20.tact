struct Rec1 {
    a: Int;
}

struct Rec2 {
    r: Rec1;
}

struct Rec3 {
    r: Rec2;
}

contract TestRecursion {
    val: Rec3;

    init() {
        self.val = Rec3{ r: Rec2{ r: Rec1{ a: 42 } } };
    }
}