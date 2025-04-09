struct Rec1 {
    a: Int;
    r: Rec2?;
}

struct Rec2 {
    b: Int;
}

contract Test {
    val: Rec1;

    init() {
        self.val = Rec1{ a: 5, r: Rec2 { b: 7 } };
    }
}