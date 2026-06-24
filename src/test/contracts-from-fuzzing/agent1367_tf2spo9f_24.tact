struct Chain {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
}

contract OptionMix {
    val: Chain;

    init() {
        self.val = Chain{a:1,b:null,c:2,d:null,e:3};
    }
}