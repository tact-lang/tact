// Struct with nested optional string, assigned/reassigned
struct NestedOptStr {
    s: String?;
}

contract ReassignOpt {
    val: NestedOptStr = NestedOptStr{ s: null };

    init() {
        self.val.s = "abc";
        self.val.s = null;
        self.val.s = "def";
    }
}