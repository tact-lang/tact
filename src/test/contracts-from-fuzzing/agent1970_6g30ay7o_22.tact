struct Wrapper {
    intf: Int;
    opt_inner: Inner?;
}

struct Inner {
    val: Bool;
}

contract OptWrap {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            intf: 42,
            opt_inner: Inner{val:true}
        };
    }
}