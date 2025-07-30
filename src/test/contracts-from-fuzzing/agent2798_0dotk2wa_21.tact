struct DeepNestOptionalMixed {
    a: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    b: Bool?;
    c: String?;
    inner: InnerStruct?;
}

struct InnerStruct {
    d: Int?;
    e: Bool?;
}

contract DeepNestOptionalMixedContract {
    data: DeepNestOptionalMixed;

    init() {
        self.data = DeepNestOptionalMixed{
            a: null,
            sub: SubStruct{
                b: true,
                c: null,
                inner: InnerStruct{
                    d: null,
                    e: false
                }
            }
        };
    }
}