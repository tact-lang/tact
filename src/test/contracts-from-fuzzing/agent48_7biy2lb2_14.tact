struct StructA {
    a: Int;
    b: Int?;
}

struct StructB {
    stA: StructA;
    c: Int?;
}

contract TestContract {
    f1: StructB;

    init() {
        self.f1 = StructB{
            stA: StructA{ a: 7, b: null },
            c: 14
        };
    }
}