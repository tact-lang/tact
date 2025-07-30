struct InnerStruct {
    f1: Int?;
    f2: Address?;
    f3: Cell;
}

struct OuterStruct {
    g1: Bool;
    g2: InnerStruct?;
    g3: Address;
    g4: Cell?;
}

contract MixedReferences {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            g1: true,
            g2: null,
            g3: myAddress(),
            g4: null,
        };
    }
}