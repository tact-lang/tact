struct Mix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optC: Cell?;
    optSL: Slice?;
}

struct Wrap {
    nest: Mix;
    optNest: Mix?;
    flag: Bool;
    note: String?;
}

contract ComboPersistent {
    store: Wrap;

    init() {
        self.store = Wrap{
            nest: Mix{
                i:1, b:true,s:"hi",c:emptyCell(), sl:emptyCell().asSlice(),
                optI:null,optB:null,optS:null,optC:null,optSL:null
            },
            optNest:null,
            flag:false,
            note:null
        };
    }
}