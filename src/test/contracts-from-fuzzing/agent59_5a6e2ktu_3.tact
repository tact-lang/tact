struct Nest {
    inner1: Int;
    inner2: Int;
    inner3: Int;
    inner4: Int;
    inner5: Int;
}

contract TestContract {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    nested: Nest;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.nested = Nest{ inner1: 6, inner2:7, inner3:8, inner4:9, inner5:10 };
    }
}