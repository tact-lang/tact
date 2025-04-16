struct InnerA { aa: Int; bb: Bool; }
struct InnerB { cc: String; dd: Bool?; ee: Int; }

struct Outer {
    a: InnerA;
    b: InnerB;
    opt: InnerB?;
}

contract MultipleStructNesting {
    testStruct: Outer;

    init() {
        self.testStruct = Outer{
            a: InnerA{ aa:1, bb:true },
            b: InnerB{ cc:"ok", dd:null, ee:42 },
            opt: null
        };
    }
}