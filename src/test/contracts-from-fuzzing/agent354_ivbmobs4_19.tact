struct OptionalsAndPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int;
    h: Bool;
    i: Address;
}

contract MixNullableTest {
    data: OptionalsAndPrimitives;

    init() {
        self.data = OptionalsAndPrimitives{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: myAddress(),
            g: 1,
            h: false,
            i: myAddress()
        };
    }
}