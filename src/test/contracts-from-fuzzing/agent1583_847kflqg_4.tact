struct Big {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    int7: Int;
    int8: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    bool5: Bool;
    str1: String;
    str2: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ManyFields {
    data: Big;

    init() {
        self.data = Big{
            int1: 1,
            int2: 2,
            int3: 3,
            int4: 4,
            int5: 5,
            int6: 6,
            int7: 7,
            int8: 8,
            bool1: true,
            bool2: false,
            bool3: true,
            bool4: false,
            bool5: true,
            str1: "a",
            str2: "b",
            optInt: null,
            optBool: null,
            optStr: null,
        };
    }
}