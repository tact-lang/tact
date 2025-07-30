struct SChain {
    s1: Int?;
    s2: Int?;
    s3: String?;
    s4: Bool?;
}

contract OptStructsMany {
    x: SChain;
    y: SChain;

    init() {
        self.x = SChain{
            s1: null,s2: 2,s3:null,s4:true
        };
        self.y = SChain{
            s1: 1,s2: null,s3:"hi",s4:null
        };
    }
}