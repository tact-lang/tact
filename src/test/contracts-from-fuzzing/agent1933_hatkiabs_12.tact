struct Sub1 {
    a: Int;
}

struct Sub2 {
    b: Bool;
}

struct Combined {
    s1: Sub1;
    s2: Sub2;
}

contract MultipleStructs {
    combined: Combined;

    init() {
        self.combined = Combined{
            s1: Sub1{a: 99},
            s2: Sub2{b: true},
        };
    }
}