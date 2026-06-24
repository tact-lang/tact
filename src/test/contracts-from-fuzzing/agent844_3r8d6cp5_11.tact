struct DeepLevel3 {
    z: String;
    opt: Int?;
}

struct DeepLevel2 {
    lev3: DeepLevel3;
    flag: Bool;
}

struct DeepLevel1 {
    lev2: DeepLevel2;
    s: String?;
}

contract ExtraDeep {
    data: DeepLevel1 = DeepLevel1{
        lev2: DeepLevel2{
            lev3: DeepLevel3{z:"hello", opt:null},
            flag: true
        },
        s: null
    };
}