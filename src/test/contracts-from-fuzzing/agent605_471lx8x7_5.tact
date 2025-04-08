struct S1 {
    a: Int;
}

struct S2 {
    b: Bool?;
    c: String;
}

contract TestContract {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ a: 7 };
        self.s2 = S2{
            b: true,
            c: "hello"
        };
    }
}