struct Middle {
    number: Int;
    optStr: String?;
}

struct Outer {
    inner1: Middle;
    inner2: Middle;
    inner3: Middle;
    flag: Bool;
}

contract ManyNested {
    store: Outer;
    init() {
        self.store = Outer{
            inner1: Middle{number:1, optStr:null},
            inner2: Middle{number:2, optStr:"hi"},
            inner3: Middle{number:-1, optStr:null},
            flag: false,
        };
    }
}