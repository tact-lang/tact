struct MultiOptional {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;
}

contract MultiOptTest {
    val: MultiOptional;
    init() {
        self.val = MultiOptional{
            intOpt:null, boolOpt:null, addrOpt:null, cellOpt:null, sliceOpt:null, strOpt:null
        };
    }
}