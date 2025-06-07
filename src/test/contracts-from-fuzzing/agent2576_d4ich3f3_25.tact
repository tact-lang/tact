struct NestedOptMix {
    inn: Int?;
    txt: String;
}

struct OuterMix {
    a: NestedOptMix;
    b: NestedOptMix?;
    c: String?;
}

contract ComplexNullableStruct {
    mix: OuterMix;

    init() {
        self.mix = OuterMix{
            a: NestedOptMix{inn: 1, txt: "hello"},
            b: null,
            c: null
        };
    }
}