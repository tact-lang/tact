struct OptBits {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
}

contract OptBitsPersist {
    optbits: OptBits;

    init() {
        self.optbits = OptBits{
            b1:null, b2:null, b3:null, b4:null, b5:null
        };
    }
}