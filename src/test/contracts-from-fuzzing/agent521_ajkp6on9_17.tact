struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

contract MultiAssign {
    store: S2;

    init() {
        self.store = S2{b:S1{a:5}};
        self.store = S2{b:S1{a:9}};
    }
}