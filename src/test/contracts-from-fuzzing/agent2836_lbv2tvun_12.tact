struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    c: Int;
    d: StructA;
}

contract MultiNested {
    val: StructB;

    init() {
        self.val = StructB{
            c: 7,
            d: StructA{a: 3, b: true}
        };
    }
}