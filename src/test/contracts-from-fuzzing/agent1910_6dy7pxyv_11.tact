struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract MixedFields {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}
