struct Inner {
    val: Int;
}

contract OptStruct {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}