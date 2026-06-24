struct Sigma {
    a: Int;
    b: Bool;
    c: String;
}

contract BigVsSmall {
    big1: Sigma;
    big2: Sigma;
    small: Int;

    init() {
        self.big1 = Sigma{a:1,b:true,c:"hi"};
        self.big2 = Sigma{a:2,b:false,c:"bye"};
        self.small = 99;
    }
}