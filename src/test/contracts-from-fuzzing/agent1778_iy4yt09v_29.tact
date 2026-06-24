struct Inner {
    s: String;
}

contract OptionalStruct {
    val: Inner?;

    init() {
        self.val = Inner{s: "hello"};
    }
}