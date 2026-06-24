struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: String;
    b2: Int?;
}

struct Combo {
    f1: A;
    f2: B;
    f3: Int;
    f4: Bool?;
    f5: String;
}

contract NestedStructs {
    combo: Combo;

    init() {
        self.combo = Combo{
            f1: A{ a1: 1, a2: true },
            f2: B{ b1: "hey", b2: null },
            f3: 5,
            f4: null,
            f5: "yo"
        };
    }
}