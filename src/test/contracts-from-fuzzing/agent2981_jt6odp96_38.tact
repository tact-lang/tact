struct Pack {
    i: Int; b: Bool; s: String;
    a: Address; c: Cell; sl: Slice;
}

contract StructBigFields {
    p: Pack;

    init() {
        self.p = Pack{
            i:123, b:true, s:"hi", a:myAddress(), c:emptyCell(), sl:"stuff".asComment().asSlice(),
        };
    }
}