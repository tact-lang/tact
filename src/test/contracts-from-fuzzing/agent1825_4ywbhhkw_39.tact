struct Mix {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract AllPrims {
    m: Mix;
    init() {
        self.m = Mix{
            i:12,b:true,s:"abc",c:emptyCell(),sl:emptyCell().asSlice(),a:myAddress()
        };
    }
}
