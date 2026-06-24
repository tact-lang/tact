struct OptionBoolSizes {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    b6: Bool?;
    b7: Bool?;
    b8: Bool?;
    b9: Bool?;
    b10: Bool?;
}

contract OptionBoolSizesTest {
    s: OptionBoolSizes;

    init() {
        self.s = OptionBoolSizes{
            b1:null,b2:null,b3:null,b4:null,b5:null,b6:null,b7:null,b8:null,b9:null,b10:null,
        };
    }
}