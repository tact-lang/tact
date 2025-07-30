struct NestedA {
    val: Int;
}

struct NestedB {
    a: NestedA;
}

struct NestedC {
    b: NestedB;
}

contract PersistenceDeepNest {
    c: NestedC;

    init() {
        self.c = NestedC { b: NestedB { a: NestedA { val: 99 } } };
    }
}