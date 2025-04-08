struct Chain {
    c1: Int;
    c2: Int?;
    c3: Int;
    c4: Int?;
    c5: Int;
}

contract OptAlternating {
    chain: Chain;

    init() {
        self.chain = Chain{
            c1:1, c2:null, c3:3, c4:null, c5:5
        };
    }
}