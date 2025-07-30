struct Inner {
    val: Int;
}

contract FieldReassign {
    data: Inner;

    init() {
        self.data = Inner{ val: 1 };
        self.data = Inner{ val: 42 };
    }
}
