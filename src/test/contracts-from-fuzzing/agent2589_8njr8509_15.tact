struct S1 { a: Int }
struct S2 { b: Int }
struct Both {
    s1: S1;
    s2: S2;
}

contract CombineTwoStructs {
    combined: Both;

    init() {
        self.combined = Both{
            s1: S1{ a: 1 },
            s2: S2{ b: 2 },
        };
    }
}