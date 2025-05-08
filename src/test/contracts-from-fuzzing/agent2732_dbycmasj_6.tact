struct StructA {
    a: Int;
    b: Int;
}

struct StructB {
    x: StructA;
    y: StructA;
}

contract TestContract {
    data: StructB;

    init() {
        self.data = StructB{
            x: StructA{ a:1, b:2 },
            y: StructA{ a:3, b:4 },
        };
    }
}