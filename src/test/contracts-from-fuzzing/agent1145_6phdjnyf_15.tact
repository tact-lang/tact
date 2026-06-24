struct LargeContractStruct {
    f01: Int;
    f02: String;
    f03: Bool;
    f04: Int?;
    f05: String?;
    f06: Bool?;
    f07: Int as uint8;
    f08: Int as int16;
    f09: Int as uint32;
    f10: Int as int64;
    f11: Address;
    f12: Address?;
    f13: Cell;
    f14: Cell?;
    f15: Int;
}

contract LargeTest {
    large: LargeContractStruct;

    init() {
        self.large = LargeContractStruct{
            f01:1,f02:"f02",f03:true,f04:2,f05:"f05",f06:false,f07:7,f08:-8,f09:9,f10:10,
            f11:myAddress(),f12:myAddress(),f13:emptyCell(),f14:emptyCell(),f15:15
        };
    }
}
