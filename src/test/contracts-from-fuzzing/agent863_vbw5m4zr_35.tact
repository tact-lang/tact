struct PrimitiveHolder {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract PrimitiveWrap {
    data: PrimitiveHolder;

    init() {
        self.data = PrimitiveHolder{
            i:1, b:true, s:"s", a:myAddress(), c:emptyCell(), sl:emptyCell().asSlice()
        };
    }
}