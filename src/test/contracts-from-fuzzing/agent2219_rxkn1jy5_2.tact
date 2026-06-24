struct Nested2 {
    i: Int;
    s: String;
}

struct Outer2 {
    s1: String;
    n: Nested2;
    s2: String;
}

contract ComplexNested2 {
    data: Outer2;

    init() {
        self.data = Outer2{
            s1: "hello",
            n: Nested2{ i: 99, s: "inner" },
            s2: "world"
        };
    }
}