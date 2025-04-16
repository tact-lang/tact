struct LargeQuantityOptionals {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    x6: Int?;
    x7: Int?;
    x8: Int?;
    x9: Int?;
    x10: Int?;
    x11: Int?;
    x12: Int?;
}

contract LargeQuantityOptionalsTest {
    q: LargeQuantityOptionals;

    init() {
        self.q = LargeQuantityOptionals{
            x1:null,x2:null,x3:null,x4:null,x5:null,x6:null,x7:null,x8:null,x9:null,x10:null,x11:null,x12:null,
        };
    }
}