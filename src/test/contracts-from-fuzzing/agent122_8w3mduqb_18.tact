struct OptInt {
    a: Int?;
    b: Int;
}

struct LargerNested {
    inner1: OptInt;
    inner2: OptInt;
    flag: Bool;
    count: Int;
}

contract TwoOptionals {
    nested: LargerNested = LargerNested{
        inner1: OptInt{a:null,b:0},
        inner2: OptInt{a:null,b:0},
        flag: false,
        count: 0,
    };
    init() {
        self.nested = LargerNested{
            inner1: OptInt{a:1,b:2},
            inner2: OptInt{a:3,b:4},
            flag: true,
            count: 42,
        };
    }
}
