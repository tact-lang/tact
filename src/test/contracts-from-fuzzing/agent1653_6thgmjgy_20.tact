// Excessively large struct with diverse fields
struct BigOne {
    f1: Int;
    f2: String;
    f3: Bool?;
    f4: Int?;
    f5: String;
    f6: Int;
    f7: String?;
    f8: Bool;
    f9: Int?;
    f10: Bool?;
    f11: String;
    f12: Int;
    f13: String;
    f14: Int?;
    f15: Bool;
}

contract TestContract {
    big: BigOne;

    init() {
        self.big = BigOne{
            f1:1, f2:"a", f3:null, f4:null, f5:"b",
            f6:2, f7:null, f8:true, f9:9, f10:false,
            f11:"c", f12:3, f13:"d", f14:14, f15:false
        };
    }
}