struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Slice;
    e: Cell?;
    f: Address;
    g: Sub;
}

struct Sub {
    x: Int?;
    y: Bool;
}

contract Test {
    comp: Complex;
    init() {
        self.comp = Complex{
            a:1, b:true, c:null, d:slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
            e:null, f:address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2"),
            g:Sub{x:null, y:false}
        };
    }
}