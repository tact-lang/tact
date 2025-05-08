struct DeepLevel1 { 
    a: Int; 
    b: Bool;
    c: Int?;
}

struct DeepLevel2 {
    l1: DeepLevel1; 
    val: Int?;
}

struct DeepLevel3 {
    l2: DeepLevel2;
    flag: Bool;
    extra: Int;
}

contract TestDeepChain {
    chain: DeepLevel3;

    init() {
        self.chain = DeepLevel3{
            l2: DeepLevel2{
                 l1: DeepLevel1{ a:1, b:true, c:null },
                 val: null
            },
            flag: false,
            extra: 7
        };
    }
}
