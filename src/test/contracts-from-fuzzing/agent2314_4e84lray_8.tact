struct InnerA {
    valueA: Int;
}

struct InnerB {
    valueB: Int;
}

struct OuterUnion {
    innerA: InnerA?;
    innerB: InnerB?;
    flag: Bool;
}

contract TestMutuallyOptionalStructs {
    storage: OuterUnion;

    init() {
        self.storage = OuterUnion{
            innerA: null,
            innerB: InnerB{ valueB: 42 },
            flag: true
        };
    }
}