struct InnerBool {
    v: Bool;
}

contract BoolInStruct {
    inner: InnerBool;

    init() {
        self.inner=InnerBool{v:true};
    }
}