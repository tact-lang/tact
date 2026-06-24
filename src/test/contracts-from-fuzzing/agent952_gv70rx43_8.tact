struct WrapMany {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
    f6: Int?; f7: Int?; f8: Int?; f9: Int?; f10: Int?;
}

contract ManyOpts {
    s: WrapMany;

    init() {
        self.s = WrapMany{
            f1:null, f2:1, f3:null, f4:1, f5:null,
            f6:1, f7:null, f8:1, f9:null, f10:1
        };
    }
}
