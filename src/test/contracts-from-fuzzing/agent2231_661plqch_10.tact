struct LongOptionalChain {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    i4: Int?;
    i5: Int?;
}

contract LongOptionalsContract {
    chain: LongOptionalChain;

    init() {
        self.chain = LongOptionalChain{
            i1:null,i2:null,i3:null,i4:null,i5:null
        };
    }
}