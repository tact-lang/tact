struct Inner {
    data: Int?;
}

contract OptionalInitNonNull {
    val: Inner?;

    init() {
        self.val = Inner{ data: 123 };
    }
}