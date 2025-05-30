struct Inner {
    val: Int;
}

contract OptionalStruct {
    field: Inner?;

    init() {
        self.field = Inner{val: 123};
    }
}