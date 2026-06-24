struct NestedA {
    val: Int;
}

struct NestedB {
    a: NestedA;
}

contract MultipleNested {
    b: NestedB;

    init() {
        self.b = NestedB{
            a: NestedA{
                val: 123
            }
        };
    }
}