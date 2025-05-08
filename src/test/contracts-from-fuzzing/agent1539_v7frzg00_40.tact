struct WrappedBool {
    a: Bool;
}

contract BoolInContract {
    w: WrappedBool;
    init() {
        self.w = WrappedBool{a:true};
    }
}