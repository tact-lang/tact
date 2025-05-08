struct MixDef {
    a: Int;
    b: Bool = false;
    c: String?;
    d: Slice;
}

contract MixedDefaults {
    data: MixDef;

    init() {
        self.data = MixDef{
            a:1,
            c:null,
            d: emptyCell().asSlice()
        };
    }
}