struct InnerA {
    a: Int = -1;
}

struct InnerB {
    b: Int;
}

struct OuterMix {
    ia: InnerA;
    ib: InnerB;
}

contract MixedInnerDefaults {
    data: OuterMix;

    init() {
        self.data = OuterMix{
            ia: InnerA{},
            ib: InnerB{b:5}
        };
    }

    receive() {
        let _ = self.data.ia.a + self.data.ib.b;
    }
}