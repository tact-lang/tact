struct InnerPair {
    l: Int;
    r: Bool;
}

struct OuterWithDefault {
    embedded: InnerPair;
    value: Int = 123;
    flag: Bool = false;
}

contract StructWithDefaults {
    data: OuterWithDefault;

    init() {
        self.data = OuterWithDefault{
            embedded: InnerPair{
                l: 1,
                r: true,
            }
        };
    }
}