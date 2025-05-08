struct MiddleOpt {
    inner: Inner?;
}
struct Inner {
    val: Int;
}

contract OptInStruct {
    s: MiddleOpt = MiddleOpt{ inner: null };

    init() {
        self.s = MiddleOpt{
            inner: Inner{ val: 1337 }
        };
    }
}