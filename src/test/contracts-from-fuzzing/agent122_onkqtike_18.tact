struct NestedA {
    a: Int;
}

struct NestedB {
    b: Int;
}

struct Combo {
    na: NestedA;
    nb: NestedB;
    s: String;
}

contract ComboTest {
    data: Combo;

    init() {
        self.data = Combo{
            na: NestedA{ a:1 },
            nb: NestedB{ b:2 },
            s: "string"
        };
    }
}
