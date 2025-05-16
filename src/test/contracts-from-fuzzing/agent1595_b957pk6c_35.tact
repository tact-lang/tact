struct S { val: Int; }

contract Test1 {
    s: S;
    init() { self.s = S{val:1}; }
}

contract Test2 {
    s: S;
    init() { self.s = S{val:2}; }
}
