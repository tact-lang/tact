struct Levels {
    l1: Int;
    l2: Bool;
    l3: String;
    l4: Address;
    l5: Cell;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
}

contract LotsOfFields {
    s1: Levels;
    s2: Levels;

    init() {
        self.s1 = Levels{
            l1:1,l2:true,l3:"hi",l4:myAddress(),l5:emptyCell(),
            opt1:null,opt2:null,opt3:null,opt4:null,opt5:null
        };
        self.s2 = self.s1;
    }
}