struct DeepLevel4 {
    x: Int;
}
struct DeepLevel3 {
    a: DeepLevel4;
}
struct DeepLevel2 {
    b: DeepLevel3;
}
struct DeepLevel1 {
    c: DeepLevel2;
}

contract ExtraDeepStorage {
    dvar: DeepLevel1;

    init() {
        self.dvar = DeepLevel1{c: DeepLevel2{b: DeepLevel3{a: DeepLevel4{x: 7}}}};
    }
}