struct StrOpt {
    foo: Int;
    s: String?;
}

contract NestedOptString {
    val: StrOpt;

    init() {
        self.val = StrOpt{ foo: 7, s: null };
    }
}