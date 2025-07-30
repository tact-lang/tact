struct S1 {
    v1: Int;
    v2: Bool;
    v3: Int?;
}

struct S2 {
    s1: S1;
    v4: String;
}

contract MultiNested {
    s2: S2;

    init() {
        self.s2 = S2{ s1: S1{ v1: 5, v2: false, v3: null }, v4: "hi" };
    }
}
