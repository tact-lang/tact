struct Inner {
    message: String;
}

contract OptionalNestedStr {
    val: Inner?;

    init() {
        self.val = Inner{ message: "hi" };
    }
}