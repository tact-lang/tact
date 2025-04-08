struct Inner {
    flag: Bool;
}

contract OptBoolField {
    innerOpt: Inner?;

    init() {
        self.innerOpt = Inner{flag: true};
    }
}