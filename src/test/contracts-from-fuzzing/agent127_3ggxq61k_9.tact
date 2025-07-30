struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

struct StructC {
    a: StructA;
    b: StructB;
}

contract NestedStructsDifferentTypes {
    item: StructC;

    init() {
        self.item = StructC{
            a: StructA{a:1},
            b: StructB{b:2}
        };
    }
}