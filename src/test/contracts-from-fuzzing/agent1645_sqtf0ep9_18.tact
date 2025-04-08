struct Rec1 {
    x: Int;
    r2: Rec2;
}
struct Rec2 {
    y: Int;
    r3: Rec3;
}
struct Rec3 {
    z: Int;
}

contract RecursiveDepth {
    data: Rec1;

    init() {
        self.data = Rec1{ x:1, r2: Rec2{ y:2, r3: Rec3{ z:3 } } };
    }
}