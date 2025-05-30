struct S {
    x: Int; 
    y: Int;
}

contract AssignNested {
    p: S;
    q: S;
    init() {
        self.p = S{x: 1, y: 2};
        self.q = self.p;
    }
}