struct BigOne {
    a: Int; b: Bool; c: Int?; d: Bool?; e: String; f: String?;
    g: Cell; h: Cell?; i: Slice; j: Slice?; k: Address; l: Address?;
}

contract Test {
    state: BigOne;
    init() {
        self.state = BigOne{
            a:1, b:true, c:null, d:null, e:"x", f:null,
            g:cell("te6cckEBAQEAAgAAAEysuc0="), h:null,
            i:slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="), j:null,
            k:address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2"), l:null
        };
    }
}