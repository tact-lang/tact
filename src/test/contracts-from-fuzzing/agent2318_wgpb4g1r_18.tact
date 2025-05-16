struct MixingOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;
}

contract Test {
    data: MixingOptionals = MixingOptionals{
        i:null,b:null,s:null,addr:null,c:null,sl:null
    };

    init() {
        self.data = MixingOptionals{
            i:42,
            b:true,
            s:"ok",
            addr:myAddress(),
            c:emptyCell(),
            sl:emptyCell().asSlice()
        };
    }
}
