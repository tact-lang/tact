struct NestedStr {
    inner1: InnerStr;
    inner2: InnerStr;
}

struct InnerStr {
    x: Int;
    y: Int;
}

contract TestContract {
    v: NestedStr = NestedStr{
        inner1: InnerStr{ x:1,y:2 },
        inner2: InnerStr{ x:3,y:4 }
    };
}