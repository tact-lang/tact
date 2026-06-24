struct AllOptionalPrims {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: Slice?;
    str: String?;
}

contract AllOptPrimsContract {
    p: AllOptionalPrims;
    init() {
        self.p = AllOptionalPrims{
            i:null,b:null,a:null,c:null,s:null,str:null
        };
    }
}