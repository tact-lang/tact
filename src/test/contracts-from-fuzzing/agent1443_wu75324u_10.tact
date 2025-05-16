struct Inner1 { v1: String; }
struct Inner2 { v2: Bool; }
struct Inner3 { v3: Int; }

struct Combo {
    f1: Inner1;
    f2: Inner2;
    f3: Inner3;
}

contract MultiTypeNesting {
    data: Combo;

    init() {
        self.data = Combo{
            f1: Inner1{ v1: "x" },
            f2: Inner2{ v2: false },
            f3: Inner3{ v3: 33 },
        };
    }
}