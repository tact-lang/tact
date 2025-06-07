struct InnerStr { val: String }

struct NestedStr {
    inner: InnerStr
}

contract NestedStrings {
    val: NestedStr;

    init() {
        self.val = NestedStr { inner: InnerStr { val: "deep" } };
    }
}
