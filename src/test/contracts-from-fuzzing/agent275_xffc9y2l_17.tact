struct NestedText {
    message: String;
    flag: Bool;
}

contract StructWithString {
    inner: NestedText;

    init() {
        self.inner = NestedText{ message: "hello", flag: true };
    }
}