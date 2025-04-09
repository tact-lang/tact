struct Rec1 {
    x: Int;
}

struct Rec2 {
    rec: Rec1;
}

struct Rec3 {
    rec: Rec2;
}

struct Rec4 {
    rec: Rec3;
}

contract Recursion4 {
    val: Rec4;

    init() {
        self.val = Rec4{ rec: Rec3{ rec: Rec2{ rec: Rec1{ x: 5 } } } };
    }
}
