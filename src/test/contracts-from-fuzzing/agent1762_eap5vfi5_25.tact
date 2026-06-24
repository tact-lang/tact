struct OptionalStr {
    s: String?;
}

contract DirectOptString {
    val: OptionalStr;
    init() {
        self.val = OptionalStr{ s: null };
    }
}