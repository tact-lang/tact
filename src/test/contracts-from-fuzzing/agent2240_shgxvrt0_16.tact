struct HasStringOpt {
    optStr: String?;
}

contract NestedOptionalString {
    val: HasStringOpt;

    init() {
        self.val = HasStringOpt{ optStr: "hello" };
    }
}