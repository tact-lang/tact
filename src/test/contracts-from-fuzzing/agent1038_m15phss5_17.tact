struct DeepLevel4 {
    d: Int;
}

struct DeepLevel3 {
    l4: DeepLevel4;
}

struct DeepLevel2 {
    l3: DeepLevel3;
}

struct DeepLevel1 {
    l2: DeepLevel2;
}

contract DeeplyNested4 {
    root: DeepLevel1 = DeepLevel1{
        l2: DeepLevel2{
            l3: DeepLevel3{
                l4: DeepLevel4{
                    d: 1234
                }
            }
        }
    };
    init() {}
}