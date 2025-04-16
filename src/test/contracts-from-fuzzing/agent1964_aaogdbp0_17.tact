struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Int;
}

struct Nested3 {
    c: Int;
}

contract DeepWide {
    n1: Nested1;
    n2: Nested2;
    n3: Nested3;
    
    init() {
        self.n1 = Nested1{ a: 1 };
        self.n2 = Nested2{ b: 2 };
        self.n3 = Nested3{ c: 3 };
    }
}