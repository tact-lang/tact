struct InnerOptStr {
    x: String?;
}

struct OuterOptStr {
    y: InnerOptStr?;
}

contract NestedOptionalString {
    val: OuterOptStr;

    init() {
        self.val = OuterOptStr { y: null };
    }
}