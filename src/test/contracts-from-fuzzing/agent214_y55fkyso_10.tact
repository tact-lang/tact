struct MidOpt {
    val: Int?;
    flag: Bool?;
}

struct OuterOpt {
    middle: MidOpt;
    num: Int?;
}

contract OptionalChain {
    data: OuterOpt;
    
    init() {
        self.data = OuterOpt{
            middle: MidOpt{
                val: null,
                flag: null
            },
            num: 10
        };
    }
}
