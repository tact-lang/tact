struct BoolWrap {
    flag: Bool;
}

struct OuterWithBool {
    inner: BoolWrap;
}

contract NestedBoolStruct {
    data: OuterWithBool;

    init() {
        self.data = OuterWithBool{
            inner: BoolWrap{flag:true}
        };
    }
}