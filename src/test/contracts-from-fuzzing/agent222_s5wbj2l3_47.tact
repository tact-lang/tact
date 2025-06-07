struct Rec1 {
    next: Rec2?;
}

struct Rec2 {
    next: Rec3?;
}

struct Rec3 {
    x: Int;
}

contract MultiNull {
    r: Rec1;

    init() {
        self.r = Rec1{ next: null };
    }
}