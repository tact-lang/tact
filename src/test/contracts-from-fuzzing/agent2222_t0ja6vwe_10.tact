struct Mix {
    s1: String;
    s2: String?;
    b1: Bool;
    b2: Bool?;
    i1: Int;
    i2: Int?;
    a1: Address;
    a2: Address?;
    sl1: Slice;
    sl2: Slice?;
    c1: Cell;
    c2: Cell?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            s1:"A", s2:null, b1:true, b2:null, i1:1, i2:null,
            a1:myAddress(), a2:null, sl1:emptyCell().asSlice(), sl2:null,
            c1:emptyCell(), c2:null
        };
    }
}