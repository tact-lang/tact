struct DeepInner {
    val: Int;
    flag: Bool;
}

struct MidInner {
    inner: DeepInner;
    ready: Bool;
}

struct OuterMost {
    mid: MidInner;
    topFlag: Bool;
}

contract DeepFieldStruct {
    nested: OuterMost = OuterMost{
        mid: MidInner{inner: DeepInner{val:1, flag:true}, ready:true},
        topFlag:false
    };

    init() {
        self.nested = OuterMost{
            mid: MidInner{inner: DeepInner{val:2, flag:false}, ready:false},
            topFlag:true
        };
    }
}