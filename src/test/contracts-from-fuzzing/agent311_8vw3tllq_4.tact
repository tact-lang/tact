struct NestedOpt {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    num: Int;
}

contract NestedStorage {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: InnerStruct{flag:true, num:42}
        };
    }
}