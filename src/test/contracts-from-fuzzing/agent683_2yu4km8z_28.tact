struct ManyFields {
    f01: Int; f02: Int; f03: Bool; f04: Int?; f05: String; f06: Address; f07: Int; f08: String?;
    f09: Bool?; f10: Int?; f11: String; f12: Bool; f13: Int; f14: Int; f15: Bool; f16: Int;
}

contract LotsPersistent {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            f01:1,f02:2,f03:true,f04:null,f05:"a",f06:myAddress(),f07:7,f08:null,
            f09:null,f10:null,f11:"b",f12:false,f13:13,f14:14,f15:true,f16:16
        };
    }
}