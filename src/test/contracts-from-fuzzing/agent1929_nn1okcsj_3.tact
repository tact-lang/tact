struct ManyFields {
    int0: Int;
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    bool0: Bool;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    str0: String;
    str1: String;
    str2: String;
    str3: String;
    optInt0: Int?;
    optInt1: Int?;
    optBool0: Bool?;
    optBool1: Bool?;
}

contract BigState {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            int0: 1, int1: 2, int2: 3, int3: 4, int4: 5,
            bool0: true, bool1: false, bool2: true, bool3: false,
            str0: "a", str1: "b", str2: "c", str3: "d",
            optInt0: null, optInt1: 42,
            optBool0: true, optBool1: null
        };
    }
}