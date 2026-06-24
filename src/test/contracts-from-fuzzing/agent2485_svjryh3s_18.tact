struct Rec1 {
    rec2: Rec2?;
}

struct Rec2 {
    rec3: Rec3?;
}

struct Rec3 {
    val: Int?;
}

contract RecNestedOptional {
    root: Rec1;

    init() {
        self.root = Rec1{ rec2: null };
    }
}