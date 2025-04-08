struct OptionalsAtTop {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TopNulls {
    opt: OptionalsAtTop;
    init() {
        self.opt = OptionalsAtTop{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}