struct LargeMix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Slice;
    f: Slice?;
    g: Cell;
    h: Cell?;
    i: String;
    j: String?;
    k: Address;
    l: Address?;
}

contract LargeMixTest {
    data: LargeMix;

    init() {
        self.data = LargeMix{
            a:1,b:true,c:null,d:null,
            e:emptyCell().asSlice(),f:null,
            g:emptyCell(),h:null,
            i:"s",j:null,
            k:myAddress(),l:null
        };
    }
}
