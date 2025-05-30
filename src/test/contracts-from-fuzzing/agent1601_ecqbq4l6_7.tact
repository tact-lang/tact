struct OptionalEdge {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Cell?;
}

contract Opts {
    opt: OptionalEdge;
    init() {
        self.opt = OptionalEdge{
            f1:null,f2:null,f3:null,f4:null,f5:null
        };
    }
}