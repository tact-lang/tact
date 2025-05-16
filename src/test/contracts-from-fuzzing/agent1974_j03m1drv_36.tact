struct ManyFields {
    f01: Int;
    f02: Int?;
    f03: Bool;
    f04: Int;
    f05: Int?;
    f06: Bool;
    f07: Int;
    f08: Int?;
    f09: Bool;
    f10: Int;
}

contract Large {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            f01:1, f02:null, f03:true,
            f04:2, f05:null, f06:false,
            f07:3, f08:4, f09:true,
            f10:5
        };
    }
}
