struct Nested {
    inner: Int?;
}

contract OptionNullable {
    val: Nested?;
    init() {
        self.val = null;
    }
}