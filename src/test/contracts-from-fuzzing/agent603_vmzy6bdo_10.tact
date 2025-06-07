struct Mix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddr: Address?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            i:1,
            b:true,
            s:"S",
            c:emptyCell(),
            addr:myAddress(),
            optInt:null,
            optBool:null,
            optStr:null,
            optCell:null,
            optAddr:null
        };
    }
}