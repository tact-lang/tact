struct TupleLike {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract MultiPrimitiveStruct {
    foo: TupleLike;

    init() {
        self.foo = TupleLike{
            a:1,b:true,c:"hello",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()
        };
    }
}