struct OptionalNested {
    info: String?;
    flag: Bool?;
}

struct RequiredNested {
    x: Int;
    b: Bool;
}

struct BigMix {
    optNested: OptionalNested?;
    reqNested: RequiredNested;
    s: String?;
    addr: Address;
    num: Int?;
}

contract MixOptReq {
    data: BigMix;

    init() {
        self.data = BigMix{
            optNested: OptionalNested{
                info: null,
                flag: null
            },
            reqNested: RequiredNested{
                x: 7,
                b: true
            },
            s: null,
            addr: myAddress(),
            num: null
        };
    }
}