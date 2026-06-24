struct Tiny {
    f: Int;
}

struct Mid1 {
    one: Tiny;
}

struct Mid2 {
    two: Tiny;
}

struct LargeNest {
    a: Mid1;
    b: Mid2;
    val: Int;
}

contract ManyNestings {
    data: LargeNest;

    init() {
        self.data = LargeNest{
            a: Mid1{ one: Tiny{ f: 1 } },
            b: Mid2{ two: Tiny{ f: 2 } },
            val: 3
        };
    }
}