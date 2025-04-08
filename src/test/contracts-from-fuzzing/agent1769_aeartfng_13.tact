struct Rec1 {
    item: Rec2?;
}

struct Rec2 {
    item: Rec3?;
}

struct Rec3 {
    leaf: Int?;
}

contract RecursiveOptionals {
    rec: Rec1?;

    init() {
        self.rec = null;
    }
}