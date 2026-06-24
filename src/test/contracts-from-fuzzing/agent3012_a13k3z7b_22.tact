struct NestedWrap {
    n: NestedWrap2;
}

struct NestedWrap2 {
    n2: NestedWrap3;
}

struct NestedWrap3 {
    val: Int;
}

contract ChainWrap {
    x: NestedWrap;

    init() {
        self.x = NestedWrap{
            n: NestedWrap2{
                n2: NestedWrap3{ val: 8 }
            }
        };
    }
}