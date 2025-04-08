struct Inner {
    boolField: Bool;
    optInt: Int?;
}

contract OptionalStructInContract {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}