struct OptInnerDeep {
    inner1: Inner?
}

struct Inner {
    inner2: Inner2?;
    flag: Bool;
}

struct Inner2 {
    value: Int?;
    moreFlag: Bool?;
}

contract DeepOptionOpt {
    val: OptInnerDeep;

    init() {
        self.val = OptInnerDeep{
            inner1:null
        };
    }
}