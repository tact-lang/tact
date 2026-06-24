struct Param1 {
    a: Int;
}

struct Param2 {
    b: Bool;
}

contract MultipleStructs {
    s1: Param1;
    s2: Param2;

    init() {
        self.s1 = Param1{ a: 11 };
        self.s2 = Param2{ b: true };
    }
}