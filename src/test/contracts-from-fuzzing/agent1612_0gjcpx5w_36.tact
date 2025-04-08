struct BigOptChain {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Cell?;
    opt5: Address?;
}

contract BigOptStruct {
    d: BigOptChain;

    init() {
        self.d = BigOptChain{
            opt1:null,opt2:null,opt3:null,opt4:null,opt5:null
        };
    }
}
