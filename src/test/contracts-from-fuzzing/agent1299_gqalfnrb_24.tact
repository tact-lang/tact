struct BoolNest {
    a: Bool;
    b: Bool;
}

struct WrappedBool {
    inner: BoolNest;
    flag: Bool;
}

contract BoolsDeep {
    s: WrappedBool;

    init() {
        self.s = WrappedBool{
            inner: BoolNest{ a:true, b:false },
            flag: true
        };
    }
}