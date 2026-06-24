struct NestedMix {
    a: Int;
    b: Bool?;
    c: String;
}

struct OuterMix {
    inner: NestedMix;
    flag: Bool;
    txt: String?;
}

contract MixedTypesTest {
    data: OuterMix;

    init() {
        self.data = OuterMix{
            inner: NestedMix{ a:42, b:null, c:"hi" },
            flag: true,
            txt: null
        };
    }
}