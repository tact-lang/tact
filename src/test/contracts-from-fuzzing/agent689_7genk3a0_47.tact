struct ContainsStr {
    s: String;
}

contract OptionalStructString {
    val: ContainsStr?;
    init() {
        self.val = null;
    }
}