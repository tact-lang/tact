struct BothOptions {
    fld1: Int?;
    fld2: Bool?;
}

contract OptRec {
    v: BothOptions;

    init() {
        self.v = BothOptions{
            fld1: null,
            fld2: true
        };
    }
}