struct DeepNested {
    tiny: Int as uint4;
    nopt: Bool?;
}

struct InnerMix {
    bigInt: Int as int257;
    smallInt: Int as int8;
    deep: DeepNested?;
}

struct ComplexMegaStruct {
    a: Int as int64;
    b: String;
    c: Bool;
    optInt: Int?;
    optBool: Bool?;
    inner: InnerMix;
}

contract ComplexMegaContract {
    data: ComplexMegaStruct;

    init() {
        self.data = ComplexMegaStruct{
            a: 555,
            b: "text",
            c: false,
            optInt: null,
            optBool: true,
            inner: InnerMix{
                bigInt: 999999,
                smallInt: -5,
                deep: DeepNested{
                    tiny: 8,
                    nopt: null
                }
            }
        };
    }
}