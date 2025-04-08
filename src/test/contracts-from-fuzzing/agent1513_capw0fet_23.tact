struct Param1 {
    a: Int;
}

struct Param2 {
    b: Int;
}

contract DiffStructs {
    f1: Param1;
    f2: Param2;

    init() {
        self.f1 = Param1{a:1};
        self.f2 = Param2{b:2};
    }
}