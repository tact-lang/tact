struct LargeContractFields {
    f01: Int; f02: Int?; f03: Bool; f04: String; f05: Bool?;
    f06: Int; f07: Int?; f08: Bool; f09: String; f10: Bool?;
    f11: Int; f12: Int?; f13: Bool; f14: String; f15: Bool?;
}

contract LargeFieldsContract {
    fields: LargeContractFields;

    init() {
        self.fields = LargeContractFields{
            f01:1, f02:null, f03:true, f04:"A", f05:null,
            f06:2, f07:null, f08:false, f09:"B", f10:null,
            f11:3, f12:null, f13:true, f14:"C", f15:null
        };
    }

    receive() {
        self.fields = LargeContractFields{
            f01:10, f02:20, f03:false, f04:"X", f05:true,
            f06:11, f07:21, f08:true, f09:"Y", f10:false,
            f11:12, f12:22, f13:true, f14:"Z", f15:true
        };
    }
}