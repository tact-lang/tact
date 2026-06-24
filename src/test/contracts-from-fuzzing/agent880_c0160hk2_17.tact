struct Rec1 {
    b: Rec2;
}

struct Rec2 {
    c: Rec3;
}

struct Rec3 {
    d: Int;
}

contract DeepRecTest {
    x: Rec1;

    init() {
        self.x = Rec1{b: Rec2{c: Rec3{d: 77}}};
    }
}