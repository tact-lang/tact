struct StructA {
    x: Int = 1;
}

struct StructB {
    a: StructA;
    y: Int = 2;
}

contract TwoLevel {
    field: StructB;
    init() {
        self.field = StructB{ a: StructA{}, y: 2 };
    }
}