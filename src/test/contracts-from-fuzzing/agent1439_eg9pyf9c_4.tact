struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Builder;
    f10: Address;
    f11: Cell?;
    f12: Address?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Cell;
    f20: Slice;
}

contract TestContract {
    data: LargeStruct;
    
    init() {
        self.data = LargeStruct{
            f1:0,f2:false,f3:"",f4:null,f5:null,f6:null,f7:emptyCell(),f8:emptyCell().asSlice(),f9:beginCell(),f10:myAddress(),
            f11:null,f12:null,f13:0,f14:false,f15:"",f16:null,f17:null,f18:null,f19:emptyCell(),f20:emptyCell().asSlice()
        };
    }
}