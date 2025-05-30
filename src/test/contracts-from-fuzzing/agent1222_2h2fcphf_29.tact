struct Primitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract PrimStructWrap {
    p: Primitives;

    init() {
        self.p = Primitives{
            i:1,b:true,s:"hi",a:myAddress(),c:emptyCell(),sl:emptyCell().asSlice()
        };
    }
}