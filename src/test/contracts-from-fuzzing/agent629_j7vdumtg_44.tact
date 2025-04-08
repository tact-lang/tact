struct DefaultString {
    s: String = "default";
}

contract OverrideDefaultString {
    val: DefaultString;

    init() {
        self.val = DefaultString{ s: "override" };
    }
}