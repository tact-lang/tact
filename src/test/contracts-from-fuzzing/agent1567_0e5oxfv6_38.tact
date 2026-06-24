struct AllOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
}

contract AllOptionalsContract {
    data: AllOptionals;

    init() {
        self.data = AllOptionals{
            intOpt:null,boolOpt:null,stringOpt:null,addrOpt:null,cellOpt:null,sliceOpt:null
        };
    }
}