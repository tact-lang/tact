struct Combo {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract TestContract {
    comb: Combo;
    n: Int;
    t: Bool;

    init() {
        self.comb = Combo{
            a: 5, b:true, c:myAddress(), d:emptyCell(),
            e:emptyCell().asSlice(), f:"zz", g:null, h:null, i:null
        };
        self.n = 123;
        self.t = false;
    }
}