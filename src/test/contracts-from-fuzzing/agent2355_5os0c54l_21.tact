struct NestedOptionalString {
    inner: String?;
}

contract HasNestedOptionalString {
    f: NestedOptionalString? = null;

    init() {
        self.f = NestedOptionalString{ inner: "hi" };
    }
}