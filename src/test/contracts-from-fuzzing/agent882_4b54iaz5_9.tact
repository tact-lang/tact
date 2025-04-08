struct Inner {
    s: String;
}

contract NestedOptionalString {
    data: Inner?;

    init() {
        self.data = null;
    }
}