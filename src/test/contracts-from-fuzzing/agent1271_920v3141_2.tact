struct Deep {
    i: Int;
    b: Bool;
    s: String;
}

struct Middle {
    d1: Deep;
    d2: Deep?;
    flag: Bool;
}

struct Outer {
    m: Middle;
    optionalM: Middle?;
    s: String;
    num: Int;
}

contract MultiNestTest {
    state: Outer;
    init() {
        self.state = Outer{
            m: Middle{d1: Deep{i:0,b:false,s:""},d2:null, flag:false},
            optionalM: null,
            s: "",
            num: 0
        };
    }
}