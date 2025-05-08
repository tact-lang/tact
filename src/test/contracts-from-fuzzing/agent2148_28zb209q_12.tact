struct Multiple {
    i1: Int;
    i2: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    addr: Address;
    optAddr: Address?;
    optInt: Int?;
    optBool: Bool?;
}

contract ManyTypes {
    t: Multiple;

    init() {
        self.t = Multiple{
            i1:1, i2:2, b1:true, s1:"hi", c1:emptyCell(), addr:myAddress(),
            optAddr:null, optInt:null, optBool:null
        };
    }
}