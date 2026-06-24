struct Rec {
    a: Int;
    b: Int?;
}

contract RecursionTest {
    x: Rec;
    y: Rec;

    init() {
        self.x = Rec{ a:1, b:null };
        self.y = Rec{ a:2, b:null };
    }
}