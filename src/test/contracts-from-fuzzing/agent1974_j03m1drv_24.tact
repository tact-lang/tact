struct BigOne {
    f01: Int;  f02: Int?; f03: Bool;
    f04: Int;  f05: Int?; f06: Bool;
    f07: Int;  f08: Int?; f09: Bool;
    f10: Int;  f11: Int?; f12: Bool;
    f13: Int;  f14: Int?; f15: Bool;
    f16: Int;  f17: Int?; f18: Bool;
}

contract VeryLargeField {
    val: BigOne;
    
    init() {
        self.val = BigOne{
            f01:1,f02:null,f03:true,
            f04:2,f05:null,f06:false,
            f07:3,f08:4,  f09:true,
            f10:5,f11:6,  f12:true,
            f13:7,f14:null,f15:false,
            f16:8,f17:null,f18:true
        };
    }
}
