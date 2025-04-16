struct S1 { a: Int; }
struct S2 { b: Int; }
struct Combined {
    s1: S1;
    s2: S2;
}

contract TestContract {
    combined: Combined;
    
    init() {
        self.combined = Combined{ s1: S1{a:1}, s2: S2{b:2} };
    }
}