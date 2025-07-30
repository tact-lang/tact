struct SeveralOpt {
    a: Int?;
    b: Bool?;
    c: Bool?;
    d: String?;
}

contract ChainMix {
    first: SeveralOpt?;
    second: SeveralOpt?;
    third: SeveralOpt?;

    init() {
        self.first = SeveralOpt{ a:1,b:true,c:false,d:"x" };
        self.third = SeveralOpt{ a:3,b:false,c:true,d:"z" };
    }
}