struct Mixed {
    int1: Int;
    int2: Int?;
    flag: Bool;
    flagOpt: Bool?;
    text: String;
    textOpt: String?;
    addr: Address;
    addrOpt: Address?;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract TestContract {
    mix: Mixed;
    
    init() {
        self.mix = Mixed{
            int1:1, int2:null, flag:true, flagOpt:null, text:"abc",
            textOpt:null, addr:myAddress(), addrOpt:null,
            cellVal:emptyCell(), sliceVal:emptyCell().asSlice(), builderVal:beginCell()
        };
    }
}