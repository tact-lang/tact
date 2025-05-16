struct TupleLike {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TupleContract {
    s: TupleLike;

    init() {
        self.s = TupleLike{
            a:1,b:true,c:"abc",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()
        };
    }
}