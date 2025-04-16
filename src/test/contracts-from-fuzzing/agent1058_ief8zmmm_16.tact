struct IntPair {
    a: Int;
    b: Int;
}

struct OuterS {
    inner1: IntPair;
    inner2: IntPair;
}

contract MultiStruct {
    val: OuterS;

    init() {
        self.val = OuterS{
            inner1: IntPair{a:1, b:2},
            inner2: IntPair{a:3, b:4}
        };
    }
}