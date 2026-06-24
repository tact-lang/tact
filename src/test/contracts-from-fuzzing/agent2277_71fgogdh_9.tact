struct Combo {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
}

contract MixTest {
    pack: Combo;

    init() {
        self.pack = Combo{
            i: 1,
            b: true,
            s: "hey",
            a: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null
        };
    }
}
