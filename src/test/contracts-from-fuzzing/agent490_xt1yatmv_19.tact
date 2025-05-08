struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Rec1;
    c: Int;
}

struct Rec3 {
    d: Rec2;
    e: Bool;
}

contract RecNest {
    data: Rec3;

    init() {
        self.data = Rec3{ d: Rec2{ b: Rec1{a:5}, c:6 }, e: true };
    }
}