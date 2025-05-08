struct Combo1 {
    a: Int;
}

struct Combo2 {
    b: Int;
}

contract MultiNestedDiffStructs {
    first: Combo1;
    second: Combo2;
    
    init() {
        self.first = Combo1{ a: 22 };
        self.second = Combo2{ b: 33 };
    }
}
