struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

struct Compose {
    s1: StructA;
    s2: StructB;
}

contract CompositionTest {
    val: Compose;

    init() {
        self.val = Compose{
            s1: StructA{a: 1},
            s2: StructB{b: 2},
        };
    }
}