struct InnerMost {
    str: String;
    num: Int;
}

struct Mid {
    inner: InnerMost;
    opt: Int?;
}

struct Out {
    mid: Mid;
    flag: Bool;
}

contract DeepMixTest {
    field: Out;

    init() {
        self.field = Out{mid: Mid{inner: InnerMost{str:"X",num:42}, opt:null}, flag:true};
    }
}