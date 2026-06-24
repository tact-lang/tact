struct C1 {
    a: Int;
}

struct C2 {
    b: Int;
}

contract MultiStructs {
    one: C1;
    two: C2;
    init() {
        self.one = C1{a:1};
        self.two = C2{b:2};
    }
}