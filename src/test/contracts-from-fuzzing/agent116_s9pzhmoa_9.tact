struct InnerA {
    a1: Int;
    a2: Bool;
}

struct InnerB {
    b1: String;
    b2: Address;
}

struct Complex {
    f1: Int;
    f2: InnerA;
    f3: InnerB;
    f4: String?;
}

contract ComplexStorage {
    storage: Complex;

    init() {
        self.storage = Complex{
            f1: 5,
            f2: InnerA{ a1:1, a2:true },
            f3: InnerB{ b1:"hi", b2:myAddress() },
            f4: null
        };
    }
}