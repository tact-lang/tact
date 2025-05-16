struct AllOptional {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
    cl: Cell?;
    sl: Slice?;
}

contract TestContract {
    allOpt: AllOptional;

    init() {
        self.allOpt = AllOptional{
            a:null, b:null, s:null, addr:null, cl:null, sl:null
        };
    }
}