struct Rec1 {
    val: Int = 1;
}

struct Rec2 {
    rec1a: Rec1 = Rec1{};
    rec1b: Rec1 = Rec1{};
}

struct Rec3 {
    rec2a: Rec2 = Rec2{};
    rec2b: Rec2 = Rec2{};
}

contract WideNested {
    data: Rec3 = Rec3{};

    init() {
        self.data = Rec3{};
    }
}