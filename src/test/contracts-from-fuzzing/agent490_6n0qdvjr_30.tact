struct ManyTypes {
    i: Int;
    s: String;
    b: Bool;
    optI: Int?;
    optS: String?;
    c: Cell;
    addr: Address;
}

contract TypesMix {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            i:1,
            s:"str",
            b:true,
            optI:null,
            optS:null,
            c:emptyCell(),
            addr:myAddress()
        };
    }
}