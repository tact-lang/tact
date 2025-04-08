struct NestedBool {
    fl: Bool;
}

struct WrapStruct {
    nb: NestedBool;
}

contract BoolWrap {
    w: WrapStruct = WrapStruct{nb:NestedBool{fl:true}};
    init() {
        self.w = WrapStruct{nb:NestedBool{fl:false}};
    }
    receive() {}
}