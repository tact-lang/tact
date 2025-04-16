struct MultiOptT {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    intOpt2: Int?;
    boolOpt2: Bool?;
    strOpt2: String?;
}

contract OptionalTypes {
    data: MultiOptT;

    init() {
        self.data = MultiOptT{
            intOpt:null, boolOpt:true, strOpt:null,
            intOpt2:42, boolOpt2:null, strOpt2:"done"
        };
    }

    receive() {}
}