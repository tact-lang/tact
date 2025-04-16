struct SInner {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
}

struct SMiddle {
    s1: SInner;
    s2: SInner?;
    flag: Bool;
}

struct SOuter {
    middle1: SMiddle;
    middle2: SMiddle?;
    text: String;
    num: Int as uint128;
    optional_num: Int?;
    inner_opt: SInner?;
}

contract ComplexDeep {
    data: SOuter;

    init() {
        self.data = SOuter{
            middle1: SMiddle{
                s1: SInner{f1:1,f2:true,f3:"x",f4:null},
                s2: null,
                flag: false
            },
            middle2: null,
            text: "abc",
            num: 123,
            optional_num: null,
            inner_opt: null
        };
    }
}
