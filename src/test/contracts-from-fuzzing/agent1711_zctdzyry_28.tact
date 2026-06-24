struct Rec1 { v: Int; }
contract NestedAssignment {
    x: Rec1;
    y: Rec1;

    init() {
        self.x = Rec1{ v: 7 };
        self.y = Rec1{ v: 8 };
    }
}