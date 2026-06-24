struct Mix {
    optInt: Int?;
    optBool: Bool?;
    str: String;
    optStr: String?;
    nested: NestedMix?;
}

struct NestedMix {
    a: Int;
    b: Bool;
    c: String?;
}

contract MixTest {
    m: Mix;

    init() {
        self.m = Mix{
            optInt: 5,
            optBool: null,
            str: "abc",
            optStr: null,
            nested: NestedMix{
                a: 0,
                b: true,
                c: "zzz"
            }
        };
    }
}