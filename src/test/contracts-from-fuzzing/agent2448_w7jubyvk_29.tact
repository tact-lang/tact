struct Struct1 {
    x: Int;
}

struct Struct2 {
    y: Int;
}

contract TwoStructFields {
    s1: Struct1;
    s2: Struct2;
    
    init() {
        self.s1 = Struct1{ x: 1 };
        self.s2 = Struct2{ y: 2 };
    }
}
