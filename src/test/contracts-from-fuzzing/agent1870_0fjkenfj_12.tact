struct Inner {
    amount: Int;
    flag: Bool;
}

contract OptNestedNull {
    value: Inner?;

    init() {
        self.value = null;
    }
}
