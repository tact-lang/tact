struct Inner {
    val: Int;
}

contract AssignBeforeDefault {
    field: Inner;

    init() {
        self.field = Inner{val:999};
    }
}