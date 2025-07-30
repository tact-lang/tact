struct DeepBool {
    flag: Bool;
}

struct IntStruct {
    num: Int;
    inner: DeepBool;
}

contract MultiNested {
    part: IntStruct;

    init() {
        self.part = IntStruct{num:44, inner:DeepBool{flag:true}};
    }
}