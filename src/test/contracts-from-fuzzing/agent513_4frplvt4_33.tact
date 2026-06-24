struct Combo {
    in1: Int;
    bo1: Bool;
    ad1: Address;
    ce1: Cell;
    sl1: Slice;
    bu1: Builder;
    st1: String;
    in2: Int?;
    bo2: Bool?;
    ad2: Address?;
    ce2: Cell?;
    sl2: Slice?;
    bu2: Builder?;
    st2: String?;
}

contract Mix {
    c: Combo;

    init() {
        self.c = Combo{
            in1:1, bo1:true, ad1:myAddress(), ce1:emptyCell(), sl1:emptyCell().asSlice(), bu1:beginCell(), st1:"a",
            in2:null, bo2:null, ad2:null, ce2:null, sl2:null, bu2:null, st2:null
        };
    }

    receive() {}
}