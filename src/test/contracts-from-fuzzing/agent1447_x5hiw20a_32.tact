struct InnerMix {
    x: Int;
    y: Bool?;
}

struct OuterMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: InnerMix;
}

contract MixedStructPersistent {
    data: OuterMix;

    init() {
        self.data = OuterMix{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
            e: InnerMix{ x: 7, y: null }
        };
    }
}