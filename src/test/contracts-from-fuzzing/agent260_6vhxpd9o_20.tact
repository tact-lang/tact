struct InnerWide {
    x0: Int?; x1: Int?; x2: Int?; x3: Int?;
    x4: Int?; x5: Int?; x6: Int?; x7: Int?;
    x8: Int?; x9: Int?;
}

struct MidWide {
    a: Int;
    inner: InnerWide;
}

struct OuterWide {
    m: MidWide;
}

contract DeepWideOptional {
    data: OuterWide;

    init() {
        self.data = OuterWide{
            m: MidWide{
                a: 5,
                inner: InnerWide{
                    x0:null,x1:null,x2:null,x3:null,x4:null,
                    x5:null,x6:null,x7:null,x8:null,x9:null
                }
            }
        };
    }
}