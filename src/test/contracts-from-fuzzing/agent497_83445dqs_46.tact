struct DeepOptionChain {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    d: Int?;
    e: String?;
}

contract OptionChain {
    d: DeepOptionChain;

    init() {
        self.d = DeepOptionChain{
            a:null,
            b:true,
            c:InnerOpt{d:null,e:null}
        };
    }
}