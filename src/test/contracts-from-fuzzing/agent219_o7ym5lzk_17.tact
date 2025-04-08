struct S1 { s: String; }
struct S2 { s: String; }

struct Combined {
    one: S1;
    two: S2;
    flag: Bool;
    optS1: S1?;
    optS2: S2?;
}

contract NestedStringOpts {
    comb: Combined;

    init() {
        self.comb = Combined{
            one: S1{ s: "A" },
            two: S2{ s: "B" },
            flag: true,
            optS1: null,
            optS2: null
        };
    }
}