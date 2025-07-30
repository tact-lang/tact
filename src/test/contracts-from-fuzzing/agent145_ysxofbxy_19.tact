struct MixedTypes {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Address;
}

contract MixedStructFields {
    data: MixedTypes;
    x: Int;

    init() {
        self.data = MixedTypes {
            a: 100,
            b: true,
            c: null,
            d: false,
            e: "abc",
            f: myAddress()
        };
        self.x = 42;
    }
}