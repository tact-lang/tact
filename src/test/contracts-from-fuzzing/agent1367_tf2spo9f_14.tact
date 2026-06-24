struct Inner {
    flag: Bool;
}

contract ReferenceOptional {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}