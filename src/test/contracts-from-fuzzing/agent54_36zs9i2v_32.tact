struct BigOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract OptionQuad {
    data: BigOpt;

    init() {
        self.data = BigOpt{
            a:1,b:null,c:2,d:null
        };
    }
}