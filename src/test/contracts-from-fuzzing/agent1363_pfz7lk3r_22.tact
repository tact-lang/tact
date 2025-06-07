struct BoolNestedWrap {
    inner: BoolWrap;
}

struct BoolWrap {
    value: Bool;
}

contract NestedBoolStruct {
    val: BoolNestedWrap;

    init() {
        self.val = BoolNestedWrap{
            inner: BoolWrap{value: true},
        };
    }
}