struct A {
    x: Int;
}

struct B {
    x: Int;
    y: Int;
}

struct MultiVariant {
    sA: A;
    sB: B;
}

contract MultiStructs {
    storage: MultiVariant;

    init() {
        self.storage = MultiVariant{
            sA: A{ x: 1 },
            sB: B{ x: 2, y: 3 }
        };
    }
}