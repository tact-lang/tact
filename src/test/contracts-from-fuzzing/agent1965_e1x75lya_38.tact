struct Rec {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MaxDiversity {
    r1: Rec;
    r2: Rec;
    init() {
        self.r1 = Rec{a:1,b:"b",c:true,d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()};
        self.r2 = Rec{a:2,b:"bb",c:false,d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()};
    }
}