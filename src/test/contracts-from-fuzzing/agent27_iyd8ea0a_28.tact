struct MixNested {
    a: Int?;
    b: InnerStruct?;
}

struct InnerStruct {
    c: String?;
    d: Int;
}

contract LayeredOptional {
    store: MixNested;

    init() {
        self.store = MixNested{
            a: null,
            b: InnerStruct{
                c: null,
                d: 5
            }
        };
    }
}