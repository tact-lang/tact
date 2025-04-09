struct NestedA {
    a: Int;
}

struct NestedB {
    b: Int;
}

struct Both {
    na: NestedA;
    nb: NestedB;
}

contract MultiNested {
    val: Both;

    init() {
        self.val = Both{
            na: NestedA{ a: 7 },
            nb: NestedB{ b: 9 }
        };
    }
}