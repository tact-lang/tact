struct NestedStr {
    s1: InnerStr1;
    s2: InnerStr2;
}

struct InnerStr1 {
    val: Int;
}

struct InnerStr2 {
    optVal: Int?;
}

contract MultiNestedStructs {
    st: NestedStr;
    init() {
        self.st = NestedStr{
            s1: InnerStr1{ val: 1 },
            s2: InnerStr2{ optVal: null }
        };
    }
}