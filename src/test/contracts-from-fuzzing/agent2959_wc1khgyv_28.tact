struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    s: S1;
}

contract DefaultStructPersistence {
    data: S2;

    init() {
        self.data = S2{y:0,s:S1{x:0}};
    }
}