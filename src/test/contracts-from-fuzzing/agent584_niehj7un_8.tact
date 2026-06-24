struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

struct Combined {
    s1: S1;
    s2: S2;
    b: Bool;
}

contract MultiStructs {
    combined: Combined;
    
    init() {
        self.combined = Combined{
            s1: S1{ x: 1 },
            s2: S2{ y: 2 },
            b: true
        };
    }
}