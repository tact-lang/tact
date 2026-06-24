struct A { val: Int; }
contract Contract1 {
    f: A;
    init() { self.f = A{ val:1 }; }
}

struct B { val: Int; }
contract Contract2 {
    f: B;
    init() { self.f = B{ val:2 }; }
}