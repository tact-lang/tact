struct StructA {
    x: Int;
}

struct StructB {
    a: StructA;
    b: StructA;
}

contract TestContract {
    nestedStructs: StructB;

    init() {
        self.nestedStructs = StructB{
            a: StructA{x:1},
            b: StructA{x:2}
        };
    }
}