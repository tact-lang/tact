struct ManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    optI: Int?;
    optB: Bool?;
    optA: Address?;
    optS: String?;
    optC: Cell?;
}

contract TestContract {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{
            i:1,b:true,a:myAddress(),s:"hi",c:emptyCell(),
            optI:null,optB:null,optA:null,optS:null,optC:null
        };
    }

    receive() {
        let _ = self.mt.i;
    }
}