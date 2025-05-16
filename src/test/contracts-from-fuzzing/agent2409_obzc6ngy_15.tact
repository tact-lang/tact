struct S1 {
    v1: Int;
    v2: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract DuplicateStructNested {
    data: S2;

    init() {
        self.data = S2{
            s1a: S1{ v1:10, v2:20 },
            s1b: S1{ v1:30, v2:40 }
        };
    }
}