struct InnerStr {
    val1: Int;
    val2: Bool;
}

struct MidStr {
    s1: InnerStr;
    s2: InnerStr;
    
    optS: InnerStr?;
    optInt: Int?;
}

contract MultipleNest {
    nested: MidStr;

    init() {
        self.nested = MidStr{
            s1: InnerStr{ val1:1, val2:true },
            s2: InnerStr{ val1:2, val2:false },
            optS: null,
            optInt: null
        };
    }
}