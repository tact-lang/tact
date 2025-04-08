struct NestedInner {
    flag: Bool;
    number: Int;
}

struct NestedOuter {
    inner1: NestedInner;
    inner2: NestedInner;
}

contract NestedPersistContract {
    bigField: NestedOuter;

    init() {
        self.bigField = NestedOuter{
            inner1: NestedInner{flag:true, number:42},
            inner2: NestedInner{flag:false, number:24}
        };
    }
}