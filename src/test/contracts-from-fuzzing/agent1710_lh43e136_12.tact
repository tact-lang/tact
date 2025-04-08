struct Rec1 {
    a: Int;
    b: Bool;
}

struct Rec2 {
    c: String;
    d: Rec1;
    e: Bool?;
}

contract PersistRec2 {
    s: Rec2;

    init() {
        self.s = Rec2{ c: "hi", d: Rec1{ a: 1, b: false }, e: null };
    }
}