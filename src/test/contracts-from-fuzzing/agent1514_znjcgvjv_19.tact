struct BothOptions {
    a: Int?;
    b: Bool?;
}

contract OptionalsInStruct {
    s: BothOptions;

    init() {
        self.s = BothOptions{ a:null, b:null };
    }
}