struct StructA { a: Int; }
struct StructB { 
    a: StructA;
    b: Int;
}

contract NestedMultiField {
    val: StructB;
    init() {
        self.val = StructB{
            a: StructA{ a: 123 },
            b: 456
        };
    }
}