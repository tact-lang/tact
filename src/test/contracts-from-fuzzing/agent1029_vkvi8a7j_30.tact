struct ComposeOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    sliceOpt: Slice?;
}

contract ComposeOpt {
    data: ComposeOptionals;
    init() {
        self.data = ComposeOptionals{
            intOpt:null, boolOpt:null, stringOpt:null, sliceOpt:null
        };
    }
}