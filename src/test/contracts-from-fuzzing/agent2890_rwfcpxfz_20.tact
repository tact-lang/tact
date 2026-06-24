struct Rec1 {
    next: Rec2;
}

struct Rec2 {
    value: Int;
}

contract CrossRecursionTest {
    data: Rec1;
    init() {
        self.data = Rec1{ next: Rec2{ value:42 } };
    }
}