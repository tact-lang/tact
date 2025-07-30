struct S1 { a: Int }
struct S2 { b: Int }

struct NestedMany {
    s1: S1;
    s2: S2;
    note: String;
}

contract ManyNestedStructs {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            s1: S1{ a:1 },
            s2: S2{ b:2 },
            note: "ok"
        };
    }
}