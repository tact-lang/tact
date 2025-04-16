struct DeepNested {
    val1: Int;
    val2: Bool;
    maybeString: String?;
}

struct MidNested {
    deep: DeepNested;
    optDeep: DeepNested?;
}

contract HasMid {
    fld: MidNested;

    init() {
        self.fld = MidNested{
            deep: DeepNested{val1:1, val2:true, maybeString:null},
            optDeep: null
        };
    }
}
