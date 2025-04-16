struct Rec1 { n: Int; }
struct Rec2 { r: Rec1; }
struct Rec3 { r: Rec2; }

contract Test10 {
    x: Rec3;
    y: Bool;
    init() {
        self.x = Rec3{ r: Rec2{ r: Rec1{ n: 7 } } };
        self.y = false;
    }
}
