struct InnerStruct {
    b: Bool?;
}

struct OuterStruct {
    inner: InnerStruct?;
    flag: Bool?;
}

contract OptionalMix {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{ inner: null, flag: null };
    }
}