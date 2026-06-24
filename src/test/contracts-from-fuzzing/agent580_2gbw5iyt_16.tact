struct NestedData { foo: Int } 

struct Combo {
    intField: Int;
    boolOpt: Bool?;
    nested: NestedData;
    addrOpt: Address?;
}

contract MixedPersistent {
    combo: Combo;

    init() {
        self.combo = Combo{
            intField: 123,
            boolOpt: null,
            nested: NestedData { foo: 1 },
            addrOpt: null
        };
    }
}