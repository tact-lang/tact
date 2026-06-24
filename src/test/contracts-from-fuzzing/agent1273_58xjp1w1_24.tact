struct S1 {
    a: Int;
    b: S2;
}

struct S2 {
    c: Int;
}

contract ReverseOrder {
    x: S1;

    init() {
        self.x = S1{a:1,b:S2{c:2}};
    }
}