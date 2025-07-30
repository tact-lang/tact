// optional nested struct
struct Inner {
    foo: Int;
}

contract OptStruct {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}
