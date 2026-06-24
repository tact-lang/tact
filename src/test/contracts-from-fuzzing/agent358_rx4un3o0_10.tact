struct WideOptionMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract WideOptContract {
    composite: WideOptionMix;

    init() {
        self.composite = WideOptionMix{
            a:1, b:null,
            c:true, d:null,
            e:"", f:null,
            g:myAddress(), h:null,
            i:emptyCell(), j:null
        };
    }
}
