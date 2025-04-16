struct DeepLevel3 {
    finalVal: Int;
}

struct DeepLevel2 {
    inner: DeepLevel3;
    optStr: String?;
}

struct DeepLevel1 {
    middle: DeepLevel2;
    flag: Bool;
}

contract DeepNested {
    snapshot: DeepLevel1;
    
    init() {
        self.snapshot = DeepLevel1{
            middle: DeepLevel2{
                inner: DeepLevel3{
                    finalVal: 777
                },
                optStr: null
            },
            flag: false
        };
    }
}