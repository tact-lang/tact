struct Inner {
    v: Int;
}

contract OptionalWrappedStruct {
    inn: Inner?;

    init() {
        self.inn = Inner{v:42};
    }
}