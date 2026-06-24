struct InnerSizes {
    smallInt: Int as uint3;
    negInt: Int as int7;
}

struct OuterSizes {
    inner: InnerSizes;
    bigInt: Int as uint32;
}

contract SerializeHints {
    dat: OuterSizes;

    init() {
        self.dat = OuterSizes{
            inner: InnerSizes{
                smallInt: 7,
                negInt: -10,
            },
            bigInt: 123456,
        };
    }
}