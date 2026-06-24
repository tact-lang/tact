struct BigNest {
    lv1: Int;
    lv2: Struct2;
}

struct Struct2 {
    lv3: Struct3;
    name: String?;
}

struct Struct3 {
    lv4: Struct4;
}

struct Struct4 {
    data: Int;
    flag: Bool?;
}

contract DeepChain {
    chain: BigNest;
    init() {
        self.chain = BigNest{
            lv1:0,
            lv2: Struct2{
                lv3: Struct3{
                    lv4: Struct4{data:1, flag:null}
                },
                name: null
            }
        };
    }
}