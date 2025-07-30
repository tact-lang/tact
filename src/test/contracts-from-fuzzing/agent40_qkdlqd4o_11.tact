struct ManyOptionals {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    s: String?;
    a: Address?;
    ci: Cell?;
    sl: Slice?;
    bl: Builder?;
}

contract StorageManyOptionals {
    vals: ManyOptionals;

    init() {
        self.vals = ManyOptionals{
            b1:null, b2:null, b3:null, b4:null, b5:null,
            s:null, a:null, ci:null, sl:null, bl:null
        };
    }
}