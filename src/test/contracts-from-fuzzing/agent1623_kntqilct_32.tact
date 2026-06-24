struct ABool {
    a: Bool;
}
struct ANestedBool {
    a: ABool;
}
struct MoreBool {
    nested: ANestedBool;
}

contract NestedBools {
    val: MoreBool;
    init() {
        self.val = MoreBool{ nested: ANestedBool{ a: ABool{ a: true } } };
    }
}