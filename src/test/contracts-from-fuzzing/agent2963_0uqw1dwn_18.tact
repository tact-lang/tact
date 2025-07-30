struct BigMix {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    id: Int;
    flag: Bool;
    name: String;
}

contract BigVariantTest {
    s: BigMix?;
    a: Int;
    b: Bool;

    init() {
        self.s = BigMix{
            optInt: 5,
            optBool: null,
            optStr: "x",
            id: 42,
            flag: true,
            name: "hello"
        };
        self.a = 1;
        self.b = false;
    }
}
