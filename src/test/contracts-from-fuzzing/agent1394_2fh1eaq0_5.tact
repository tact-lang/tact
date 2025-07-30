struct ManyFields {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;
    opt1: Int?;
    opt2: Bool?;
}

contract LotsOfFields {
    many: ManyFields;

    init() {
        self.many = ManyFields{
            int1: 1,
            int2: 2,
            bool1: false,
            bool2: true,
            str1: "one",
            str2: "two",
            opt1: null,
            opt2: true
        };
    }
}