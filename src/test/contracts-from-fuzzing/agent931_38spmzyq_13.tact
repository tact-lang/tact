struct Rec1 { x: Int; }
struct Rec2 { p: Rec1; }
struct Rec3 { q: Rec2; }

contract Recursion3Layer {
    r: Rec3;

    init() {
        self.r = Rec3{ q: Rec2{ p: Rec1{ x: 7 } } };
    }
}