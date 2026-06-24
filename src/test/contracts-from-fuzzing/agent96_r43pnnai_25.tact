struct ChainStruct {
    a: Int;
    optB: Int?;
    strC: String;
    inner: InnerChain;
}

struct InnerChain {
    b: Bool;
    optStr: String?;
    addr: Address;
}

contract ChainWithOptions {
    chainField: ChainStruct;

    init() {
        self.chainField = ChainStruct{
            a: 5,
            optB: null,
            strC: "hi",
            inner: InnerChain{
                b: true,
                optStr: null,
                addr: myAddress()
            }
        };
    }
}