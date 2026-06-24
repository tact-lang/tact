struct Rec1 {
    i: Int;
}
struct Rec2 {
    r1: Rec1;
    b: Bool;
}
struct Rec3 {
    r2: Rec2;
    s: String;
}

contract RecursiveLike {
    rec: Rec3;

    init() {
        self.rec = Rec3{
            r2: Rec2{ r1: Rec1{ i: 1 }, b: true },
            s: "str"
        };
    }
}
