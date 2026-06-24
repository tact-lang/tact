struct S1 {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
}

struct S2 {
    x: Int as coins;
    y: String;
    z: Address;
    s1: S1;
}

contract MixedFields {
    data: S2;

    init() {
        self.data = S2{
            x: 1000000000,
            y: "hi",
            z: myAddress(),
            s1: S1{ a: 1, b: -123456789, c: true }
        };
    }
}
