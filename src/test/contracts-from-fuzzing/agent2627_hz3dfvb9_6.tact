struct InnerMost {
    v: Int;
    s: String;
}

struct Middle {
    im: InnerMost;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    count: Int;
}

contract DeepStruct {
    storage: Outer;
    init() {
        self.storage = Outer{
            mid: Middle{im:InnerMost{v:1,s:"str"}, flag:true},
            count: 42
        };
    }
}