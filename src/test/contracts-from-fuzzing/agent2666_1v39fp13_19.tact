struct Rec1 {
    val: Int;
}

struct Rec2 {
    val: Rec1;
}

contract Recurse {
    s: Rec2;

    init() {
        self.s = Rec2{ val: Rec1{ val: 33 } };
    }
}