struct WithAllPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract PrimitivesSet {
    dat: WithAllPrimitives;

    init() {
        self.dat = WithAllPrimitives{
            a:13,b:true,c:"abc",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()
        };
    }
}