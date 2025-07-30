struct MixedStructSerialize {
    a: Int as uint32;
    b: Bool;
    c: Address;
    d: Bool?;
    e: String?;
}

contract MixedStructSerializeContract {
    data: MixedStructSerialize;

    init() {
        self.data = MixedStructSerialize{
            a: 5,
            b: true,
            c: myAddress(),
            d: null,
            e: null,
        };
    }
}