struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    s1_1: S1;
    s1_2: S1;
    s1_3: S1;
}

contract Test {
    data: S2;
    init() {
        self.data = S2{
            s1_1: S1{ a:1, b:"one" },
            s1_2: S1{ a:2, b:"two" },
            s1_3: S1{ a:3, b:"three" }
        };
    }
}