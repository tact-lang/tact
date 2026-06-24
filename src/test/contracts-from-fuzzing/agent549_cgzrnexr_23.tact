struct Small1 { a: Int; }
struct Small2 { b: Int?; }
struct Mid1 { s1: Small1; s2: Small2; }
struct Mid2 { s: Small2; }
struct Wrapper {
    m1: Mid1;
    m2: Mid2;
}
contract Wrapped {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            m1: Mid1{ s1: Small1{a:1}, s2: Small2{b:null} },
            m2: Mid2{ s: Small2{b:null} },
        };
    }

    receive() {
        self.w = Wrapper{
            m1: Mid1{ s1: Small1{a:2}, s2: Small2{b:42} },
            m2: Mid2{ s: Small2{b:100} },
        };
    }
}